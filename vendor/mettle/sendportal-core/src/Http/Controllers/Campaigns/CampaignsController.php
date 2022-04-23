<?php

declare(strict_types=1);

namespace Sendportal\Base\Http\Controllers\Campaigns;

use Exception;
use Illuminate\Contracts\View\View as ViewContract;
use Illuminate\Http\RedirectResponse;
use Sendportal\Base\Facades\Sendportal;
use Sendportal\Base\Http\Controllers\Controller;
use Sendportal\Base\Http\Requests\CampaignStoreRequest;
use Sendportal\Base\Models\EmailService;
use Sendportal\Base\Models\Tag;
use Sendportal\Base\Models\Message;
use App\Models\User;
use Sendportal\Base\Repositories\Campaigns\CampaignTenantRepositoryInterface;
use Sendportal\Base\Repositories\EmailServiceTenantRepository;
use Sendportal\Base\Repositories\Subscribers\SubscriberTenantRepositoryInterface;
use Sendportal\Base\Repositories\TagTenantRepository;
use Sendportal\Base\Repositories\TemplateTenantRepository;
use Sendportal\Base\Services\Campaigns\CampaignStatisticsService;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Sendportal\Base\Http\Resources\Subscriber;

class CampaignsController extends Controller
{
    /** @var CampaignTenantRepositoryInterface */
    protected $campaigns;

    /** @var TemplateTenantRepository */
    protected $templates;

    /** @var TagTenantRepository */
    protected $tags;

    /** @var EmailServiceTenantRepository */
    protected $emailServices;

    /** @var SubscriberTenantRepositoryInterface */
    protected $subscribers;

    /**
     * @var CampaignStatisticsService
     */
    protected $campaignStatisticsService;

    public function __construct(
        CampaignTenantRepositoryInterface $campaigns,
        TemplateTenantRepository $templates,
        TagTenantRepository $tags,
        EmailServiceTenantRepository $emailServices,
        SubscriberTenantRepositoryInterface $subscribers,
        CampaignStatisticsService $campaignStatisticsService
    ) {
        $this->campaigns = $campaigns;
        $this->templates = $templates;
        $this->tags = $tags;
        $this->emailServices = $emailServices;
        $this->subscribers = $subscribers;
        $this->campaignStatisticsService = $campaignStatisticsService;
    }

    /**
     * @throws Exception
     */
    public function index(): ViewContract
    {
        $workspaceId = Sendportal::currentWorkspaceId();
        $params = ['draft' => true];
        $campaigns = $this->campaigns->paginate($workspaceId, 'created_atDesc', ['status'], 25, $params);
        return view('sendportal::campaigns.index', [
            'campaigns' => $campaigns,
            'campaignStats' => $this->campaignStatisticsService->getForPaginator($campaigns, $workspaceId),
        ]);
    }

    /**
     * @throws Exception
     */
    public function sent(): ViewContract
    {
        $workspaceId = Sendportal::currentWorkspaceId();
        $params = ['sent' => true];
        $campaigns = $this->campaigns->paginate($workspaceId, 'created_atDesc', ['status'], 25, $params);

        return view('sendportal::campaigns.index', [
            'campaigns' => $campaigns,
            'campaignStats' => $this->campaignStatisticsService->getForPaginator($campaigns, $workspaceId),
        ]);
    }

    /**
     * @throws Exception
     */
    public function create(): ViewContract
    {
        $workspaceId = Sendportal::currentWorkspaceId();
        $templates = [null => '- None -'] + $this->templates->pluck($workspaceId);
        $emailServices = $this->emailServices->all(Sendportal::currentWorkspaceId(), 'id', ['type'])
            ->map(static function (EmailService $emailService) {
                $emailService->formatted_name = "{$emailService->name} ({$emailService->type->name})";
                return $emailService;
            });
        return view('sendportal::campaigns.create', compact('templates', 'emailServices'));
    }

    /**
     * @throws Exception
     */
    public function store(CampaignStoreRequest $request): RedirectResponse
    {
        $workspaceId = Sendportal::currentWorkspaceId();
        $campaign = $this->campaigns->store($workspaceId, $this->handleCheckboxes($request->validated()));
        return redirect()->route('sendportal.campaigns.preview', $campaign->id);
    }

    /**
     * @throws Exception
     */
    public function show(int $id): ViewContract
    {
        $campaign = $this->campaigns->find(Sendportal::currentWorkspaceId(), $id);

        return view('sendportal::campaigns.show', compact('campaign'));
    }

    /**
     * @throws Exception
     */
    public function edit(int $id): ViewContract
    {
        $workspaceId = Sendportal::currentWorkspaceId();
        $campaign = $this->campaigns->find($workspaceId, $id);
        $emailServices = $this->emailServices->all($workspaceId, 'id', ['type'])
            ->map(static function (EmailService $emailService) {
                $emailService->formatted_name = "{$emailService->name} ({$emailService->type->name})";
                return $emailService;
            });
        $templates = [null => '- None -'] + $this->templates->pluck($workspaceId);

        return view('sendportal::campaigns.edit', compact('campaign', 'emailServices', 'templates'));
    }

    /**
     * @throws Exception
     */
    public function update(int $campaignId, CampaignStoreRequest $request): RedirectResponse
    {
        $workspaceId = Sendportal::currentWorkspaceId();
        $campaign = $this->campaigns->update(
            $workspaceId,
            $campaignId,
            $this->handleCheckboxes($request->validated())
        );

        return redirect()->route('sendportal.campaigns.preview', $campaign->id);
    }

    /**
     * @return RedirectResponse|ViewContract
     * @throws Exception
     */
    public function preview(int $id)
    {
        $campaign = $this->campaigns->find(Sendportal::currentWorkspaceId(), $id);
        $subscriberCount = $this->subscribers->countActive(Sendportal::currentWorkspaceId());
        if (!$campaign->draft) {
            return redirect()->route('sendportal.campaigns.status', $id);
        }
        $tags = $this->tags->all(Sendportal::currentWorkspaceId(), 'name');
        /* Số mail tối đa có thể gửi trong 1 ngày */
        $mail_limit_day = User::where('current_workspace_id', Sendportal::currentWorkspaceId())->pluck('mail_limit_day')->first();
        /* Số mail tối đa có thể gửi trong 1 tháng */
        $mail_limit_month = User::where('current_workspace_id', Sendportal::currentWorkspaceId())->pluck('mail_limit_month')->first();
        /* Ngày kết thúc gói email của khách dùng */
        $finished_at = User::where('current_workspace_id', Sendportal::currentWorkspaceId())->pluck('finished_at')->first();
        /* số email đã sử dụng trong ngày */
        $mail_used_on_day = Message::where('workspace_id', Sendportal::currentWorkspaceId())->whereBetween('sent_at', [\Carbon\Carbon::parse('00:00:00'), \Carbon\Carbon::parse('23:59:59')])->get()->count();
        /* số email đã sử dụng trong tháng */
        $mail_used_on_month = Message::select(
            Message::raw("(COUNT(*)) as count"),
            Message::raw("MONTHNAME(created_at) as month_name")
        )
            ->whereYear('created_at', date('Y'))
            ->groupBy('month_name')
            ->get()
            ->toArray();
        /* Tổng số mail đã được gửi đi trong tháng */
        $viewData = [
            'campaign' => $campaign,
            'subscriberCount' => $subscriberCount,
            'mail_used_on_day' => $mail_used_on_day,
            'mail_limit_day' => $mail_limit_day,
            'mail_used_on_month' => $mail_used_on_month,
            'mail_limit_month' => $mail_limit_month,
            'tags' => $tags
        ];
        return view('sendportal::campaigns.preview', $viewData);
    }
    /**
     * @return RedirectResponse|ViewContract
     * @throws Exception
     */
    public function getSubscriber(Request $request)
    {
        $workspace_id = $request->workspace_id;
        $subscriber = \DB::table('sendportal_subscribers')->where('workspace_id', $workspace_id)->get();
        $html = view('sendportal::campaigns.get_subscribers',  compact('subscriber'))->render();
        return $html;
    }
    /**
     * @return RedirectResponse|ViewContract
     * @throws Exception
     */
    public function createListSub(Request $request)
    {
        $workspace_id = $request->workspace_id;
        $subscriibers_id = $request->subscriibers_id;
        $tagId = Tag::create([
            'name' => 'List-mail' . $workspace_id . '-' . Carbon::now(),
            'workspace_id' => $workspace_id
        ])->id;
        if ($tagId) {
            foreach ($subscriibers_id as $item) {
                \DB::table('sendportal_tag_subscriber')->insert([
                    'subscriber_id' => $item,
                    'tag_id'    => $tagId
                ]);
            }
        }
        $tags = Tag::find($tagId);
        return response()->json($tags);
    }
    /**
     * @return RedirectResponse|ViewContract
     * @throws Exception
     */
    public function editSubscriber(Request $request)
    {
        $tagId = $request->tagid;
        if ($tagId) {
            $g_subscriber_id = \DB::table('sendportal_tag_subscriber')->where('tag_id', $tagId)->pluck('subscriber_id');
            $subscriber = \DB::table('sendportal_subscribers')->where('workspace_id', Sendportal::currentWorkspaceId())->whereIn('id', $g_subscriber_id)->get();
        }
        $viewData = [
            'g_subscriber_id' => $g_subscriber_id,
            'subscriber' => $subscriber
        ];
        $html = view('sendportal::campaigns.get_editsubscribers', $viewData)->render();
        return $html;
    }
    /**
     * @return RedirectResponse|ViewContract
     * @throws Exception
     */
    public function status(int $id)
    {
        $workspaceId = Sendportal::currentWorkspaceId();
        $campaign = $this->campaigns->find($workspaceId, $id, ['status']);
        // dd($campaign);
        if ($campaign->sent) {
            return redirect()->route('sendportal.campaigns.reports.index', $id);
        }

        return view('sendportal::campaigns.status', [
            'campaign' => $campaign,
            'campaignStats' => $this->campaignStatisticsService->getForCampaign($campaign, $workspaceId),
        ]);
    }

    /**
     * Handle checkbox fields.
     *
     * NOTE(david): this is here because the Campaign model is marked as being unable to use boolean fields.
     */
    private function handleCheckboxes(array $input): array
    {
        $checkboxFields = [
            'is_open_tracking',
            'is_click_tracking'
        ];

        foreach ($checkboxFields as $checkboxField) {
            if (!isset($input[$checkboxField])) {
                $input[$checkboxField] = false;
            }
        }

        return $input;
    }
}