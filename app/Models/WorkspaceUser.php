<?php

declare(strict_types=1);

namespace App\Models;

use Carbon\Carbon;
use Database\Factories\WorkspaceFactory;
use Exception;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Sendportal\Base\Models\BaseModel;

/**

 *
 * @method static WorkspaceFactory factory
 */
class WorkspaceUser extends BaseModel
{
    use HasFactory;


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $guarded = [''];
    protected $table = 'workspace_users';
    protected $fillable = [
        'workspace_id',
        'user_id',
        'role'
    ];

}
