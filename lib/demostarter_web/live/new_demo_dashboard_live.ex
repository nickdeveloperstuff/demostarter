defmodule DemostarterWeb.NewDemoDashboardLive do
  use DemostarterWeb, :live_view
  
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
  
  def render(assigns) do
    ~H"""
    <!-- Hero Section with Dashboard Title -->
    <div class="hero bg-base-200 py-8">
      <div class="hero-content w-full">
        <div class="flex w-full justify-between items-center">
          <div>
            <h1 class="text-5xl font-bold">Analytics Dashboard</h1>
            <p class="py-6">Monitor your key metrics and performance indicators</p>
          </div>
          <div class="flex items-center gap-4">
            <!-- Notification Badge -->
            <div class="indicator">
              <span class="indicator-item badge badge-secondary">3</span>
              <button class="btn btn-ghost btn-circle">
                <.icon name="hero-bell" class="h-6 w-6" />
              </button>
            </div>
            <!-- User Avatar -->
            <div class="avatar">
              <div class="w-12 rounded-full">
                <div class="bg-neutral text-neutral-content rounded-full w-12 h-12 flex items-center justify-center">
                  <span class="text-xl">JD</span>
                </div>
              </div>
            </div>
            <span class="font-semibold">John Doe</span>
          </div>
        </div>
      </div>
    </div>

    <div class="divider"></div>

    <!-- Main Dashboard Content -->
    <div class="container mx-auto px-6 py-8">
      
      <!-- Statistics Overview -->
      <div class="stats shadow w-full mb-8">
        <div class="stat">
          <div class="stat-figure text-primary">
            <.icon name="hero-users" class="inline-block w-8 h-8" />
          </div>
          <div class="stat-title">Total Users</div>
          <div class="stat-value text-primary">1,234</div>
          <div class="stat-desc">21% more than last month</div>
        </div>
        
        <div class="stat">
          <div class="stat-figure text-secondary">
            <.icon name="hero-shopping-bag" class="inline-block w-8 h-8" />
          </div>
          <div class="stat-title">Orders</div>
          <div class="stat-value text-secondary">567</div>
          <div class="stat-desc">12% more than last month</div>
        </div>
        
        <div class="stat">
          <div class="stat-figure text-accent">
            <.icon name="hero-chart-bar" class="inline-block w-8 h-8" />
          </div>
          <div class="stat-title">Growth Rate</div>
          <div class="stat-value text-accent">89%</div>
          <div class="stat-desc">Target: 85%</div>
        </div>
        
        <div class="stat">
          <div class="stat-figure text-success">
            <.icon name="hero-currency-dollar" class="inline-block w-8 h-8" />
          </div>
          <div class="stat-title">Revenue</div>
          <div class="stat-value text-success">$12,345</div>
          <div class="stat-desc">↗︎ 15% increase</div>
        </div>
      </div>

      <!-- Charts and Recent Activity Row -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
        
        <!-- Charts & Analytics Section -->
        <div class="card bg-base-100 shadow-xl">
          <div class="card-body">
            <h2 class="card-title">📊 Performance Metrics</h2>
            <div class="space-y-4">
              <div>
                <div class="flex justify-between mb-1">
                  <span class="text-base font-medium">Sales Progress</span>
                  <span class="text-sm font-medium">80%</span>
                </div>
                <progress class="progress progress-primary w-full" value="80" max="100"></progress>
              </div>
              
              <div>
                <div class="flex justify-between mb-1">
                  <span class="text-base font-medium">Website Traffic</span>
                  <span class="text-sm font-medium">60%</span>
                </div>
                <progress class="progress progress-secondary w-full" value="60" max="100"></progress>
              </div>
              
              <div>
                <div class="flex justify-between mb-1">
                  <span class="text-base font-medium">Goal Achievement</span>
                  <span class="text-sm font-medium">100%</span>
                </div>
                <progress class="progress progress-success w-full" value="100" max="100"></progress>
              </div>
              
              <div>
                <div class="flex justify-between mb-1">
                  <span class="text-base font-medium">Customer Satisfaction</span>
                  <span class="text-sm font-medium">92%</span>
                </div>
                <progress class="progress progress-accent w-full" value="92" max="100"></progress>
              </div>
            </div>
          </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="card bg-base-100 shadow-xl">
          <div class="card-body">
            <h2 class="card-title">📝 Recent Activity</h2>
            <div class="space-y-3">
              <div class="alert alert-info">
                <.icon name="hero-information-circle" class="shrink-0 w-6 h-6" />
                <span>New user John Smith registered</span>
              </div>
              
              <div class="alert alert-success">
                <.icon name="hero-check-circle" class="shrink-0 h-6 w-6" />
                <span>Order #1234 completed successfully</span>
              </div>
              
              <div class="alert alert-warning">
                <.icon name="hero-exclamation-triangle" class="shrink-0 h-6 w-6" />
                <span>Payment pending for Order #1235</span>
              </div>
              
              <div class="alert">
                <.icon name="hero-document-text" class="shrink-0 w-6 h-6" />
                <span>Monthly report generated</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="divider">User Management</div>

      <!-- Data Table Section -->
      <div class="card bg-base-100 shadow-xl">
        <div class="card-body">
          <h2 class="card-title">📋 User Data</h2>
          <div class="overflow-x-auto">
            <table class="table table-zebra w-full">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Status</th>
                  <th>Role</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <div class="flex items-center gap-3">
                      <div class="avatar">
                        <div class="mask mask-squircle w-12 h-12">
                          <div class="bg-primary text-primary-content rounded w-12 h-12 flex items-center justify-center">
                            JD
                          </div>
                        </div>
                      </div>
                      <div>
                        <div class="font-bold">John Doe</div>
                        <div class="text-sm opacity-50">United States</div>
                      </div>
                    </div>
                  </td>
                  <td>john.doe@example.com</td>
                  <td><span class="badge badge-success gap-2">Active</span></td>
                  <td>Admin</td>
                  <td>
                    <div class="dropdown dropdown-end">
                      <div tabindex="0" role="button" class="btn btn-ghost btn-xs">Actions</div>
                      <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
                        <li><a>Edit Profile</a></li>
                        <li><a>View Details</a></li>
                        <li><a class="text-error">Delete User</a></li>
                      </ul>
                    </div>
                  </td>
                </tr>
                
                <tr>
                  <td>
                    <div class="flex items-center gap-3">
                      <div class="avatar">
                        <div class="mask mask-squircle w-12 h-12">
                          <div class="bg-secondary text-secondary-content rounded w-12 h-12 flex items-center justify-center">
                            JS
                          </div>
                        </div>
                      </div>
                      <div>
                        <div class="font-bold">Jane Smith</div>
                        <div class="text-sm opacity-50">Canada</div>
                      </div>
                    </div>
                  </td>
                  <td>jane.smith@example.com</td>
                  <td><span class="badge badge-warning gap-2">Pending</span></td>
                  <td>User</td>
                  <td>
                    <div class="dropdown dropdown-end">
                      <div tabindex="0" role="button" class="btn btn-ghost btn-xs">Actions</div>
                      <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
                        <li><a>Edit Profile</a></li>
                        <li><a>View Details</a></li>
                        <li><a class="text-error">Delete User</a></li>
                      </ul>
                    </div>
                  </td>
                </tr>
                
                <tr>
                  <td>
                    <div class="flex items-center gap-3">
                      <div class="avatar">
                        <div class="mask mask-squircle w-12 h-12">
                          <div class="bg-accent text-accent-content rounded w-12 h-12 flex items-center justify-center">
                            AJ
                          </div>
                        </div>
                      </div>
                      <div>
                        <div class="font-bold">Alex Johnson</div>
                        <div class="text-sm opacity-50">United Kingdom</div>
                      </div>
                    </div>
                  </td>
                  <td>alex.johnson@example.com</td>
                  <td><span class="badge badge-success gap-2">Active</span></td>
                  <td>User</td>
                  <td>
                    <div class="dropdown dropdown-end">
                      <div tabindex="0" role="button" class="btn btn-ghost btn-xs">Actions</div>
                      <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
                        <li><a>Edit Profile</a></li>
                        <li><a>View Details</a></li>
                        <li><a class="text-error">Delete User</a></li>
                      </ul>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <!-- Pagination -->
          <div class="flex justify-center mt-6">
            <div class="join">
              <button class="join-item btn">«</button>
              <button class="join-item btn">Page 1</button>
              <button class="join-item btn btn-active">2</button>
              <button class="join-item btn">3</button>
              <button class="join-item btn">»</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Action Buttons -->
      <div class="flex justify-end gap-4 mt-8">
        <button class="btn btn-primary" onclick="add_user_modal.showModal()">Add New User</button>
        <button class="btn btn-secondary">Export Data</button>
        <button class="btn btn-accent">Generate Report</button>
      </div>
    </div>

    <!-- Add User Modal -->
    <dialog id="add_user_modal" class="modal">
      <div class="modal-box">
        <h3 class="font-bold text-lg">Add New User</h3>
        <div class="py-4 space-y-4">
          <div>
            <label class="label">
              <span class="label-text">Full Name</span>
            </label>
            <input type="text" placeholder="Enter full name" class="input input-bordered w-full" />
          </div>
          
          <div>
            <label class="label">
              <span class="label-text">Email Address</span>
            </label>
            <input type="email" placeholder="Enter email address" class="input input-bordered w-full" />
          </div>
          
          <div>
            <label class="label">
              <span class="label-text">Role</span>
            </label>
            <select class="select select-bordered w-full">
              <option disabled selected>Select role</option>
              <option>Admin</option>
              <option>User</option>
              <option>Manager</option>
            </select>
          </div>
        </div>
        
        <div class="modal-action">
          <form method="dialog">
            <button class="btn">Cancel</button>
            <button class="btn btn-primary ml-2">Add User</button>
          </form>
        </div>
      </div>
    </dialog>
    """
  end
end