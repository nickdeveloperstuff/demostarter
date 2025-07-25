defmodule DemostarterWeb.DemoUiDashboardLive do
  use DemostarterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <!-- Main Dashboard Container -->
    <div class="min-h-screen bg-base-200">
      <div class="drawer lg:drawer-open">
        <input id="sidebar-toggle" type="checkbox" class="drawer-toggle" />
        
        <!-- Main Content Area -->
        <div class="drawer-content flex flex-col">
          <!-- Top Navigation Bar -->
          <div class="navbar bg-base-100 shadow-lg">
            <div class="flex-none lg:hidden">
              <label for="sidebar-toggle" class="btn btn-square btn-ghost">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                </svg>
              </label>
            </div>
            
            <!-- Search Bar -->
            <div class="flex-1 px-4">
              <div class="form-control">
                <input type="text" placeholder="Search..." class="input input-bordered w-24 md:w-auto" />
              </div>
            </div>
            
            <!-- Top Navigation Actions -->
            <div class="navbar-end gap-2">
              <!-- Notifications -->
              <div class="dropdown dropdown-end">
                <label tabindex="0" class="btn btn-ghost btn-circle">
                  <div class="indicator">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" />
                    </svg>
                    <span class="badge badge-xs badge-primary indicator-item">3</span>
                  </div>
                </label>
                <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-80">
                  <li><a>New user registration</a></li>
                  <li><a>Payment received $1,250</a></li>
                  <li><a>System maintenance scheduled</a></li>
                </ul>
              </div>
              
              <!-- User Profile -->
              <div class="dropdown dropdown-end">
                <label tabindex="0" class="btn btn-ghost btn-circle avatar">
                  <div class="avatar placeholder">
                    <div class="bg-primary text-primary-content rounded-full w-10">
                      <span class="text-sm">JD</span>
                    </div>
                  </div>
                </label>
                <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
                  <li><a>Profile</a></li>
                  <li><a>Settings</a></li>
                  <li><a>Logout</a></li>
                </ul>
              </div>
            </div>
          </div>

          <!-- Hero Section -->
          <div class="hero bg-gradient-to-r from-primary to-secondary text-primary-content py-8">
            <div class="hero-content text-center">
              <div class="max-w-md">
                <h1 class="text-4xl font-bold">SaaS Dashboard</h1>
                <p class="py-4">Monitor your business performance with real-time analytics and insights.</p>
                <button class="btn btn-accent">View Analytics</button>
              </div>
            </div>
          </div>

          <!-- Main Dashboard Content -->
          <div class="flex-1 p-6">
            <!-- Key Metrics Stats -->
            <div class="stats stats-vertical lg:stats-horizontal shadow w-full mb-6">
              <div class="stat">
                <div class="stat-figure text-primary">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <div class="stat-title">Monthly Revenue</div>
                <div class="stat-value text-primary">$45,200</div>
                <div class="stat-desc">18% increase from last month</div>
              </div>
              
              <div class="stat">
                <div class="stat-figure text-secondary">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
                  </svg>
                </div>
                <div class="stat-title">Active Users</div>
                <div class="stat-value text-secondary">1,450</div>
                <div class="stat-desc">7% increase this week</div>  
              </div>
              
              <div class="stat">
                <div class="stat-figure text-accent">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z" />
                  </svg>
                </div>
                <div class="stat-title">Conversion Rate</div>
                <div class="stat-value text-accent">3.2%</div>
                <div class="stat-desc">Above industry average</div>
              </div>
              
              <div class="stat">
                <div class="stat-figure text-success">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18L9 11.25l4.306 4.307a11.95 11.95 0 015.814-5.519l2.74-1.22m0 0l-5.94-2.28m5.94 2.28l-2.28 5.941" />
                  </svg>
                </div>
                <div class="stat-title">Growth Rate</div>
                <div class="stat-value text-success">+24%</div>
                <div class="stat-desc">Year over year</div>
              </div>
            </div>

            <!-- Progress Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
              <div class="card bg-base-100 shadow-xl">
                <div class="card-body items-center text-center">
                  <div class="radial-progress text-primary" style="--value:75;">75%</div>
                  <h3 class="card-title">Monthly Target</h3>
                  <p class="text-sm">$33.9K of $45K goal</p>
                </div>
              </div>
              
              <div class="card bg-base-100 shadow-xl">
                <div class="card-body items-center text-center">
                  <div class="radial-progress text-secondary" style="--value:88;">88%</div>
                  <h3 class="card-title">Customer Retention</h3>
                  <p class="text-sm">Excellent performance</p>
                </div>
              </div>
              
              <div class="card bg-base-100 shadow-xl">
                <div class="card-body items-center text-center">
                  <div class="radial-progress text-accent" style="--value:95;">95%</div>
                  <h3 class="card-title">System Uptime</h3>
                  <p class="text-sm">Outstanding reliability</p>
                </div>
              </div>
              
              <div class="card bg-base-100 shadow-xl">
                <div class="card-body items-center text-center">
                  <div class="radial-progress text-warning" style="--value:62;">62%</div>
                  <h3 class="card-title">Support Tickets</h3>
                  <p class="text-sm">Response time goals</p>
                </div>
              </div>
            </div>

            <!-- Quick Actions -->
            <div class="grid grid-cols-2 md:grid-cols-4 gap-3 mb-6">
              <button class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                </svg>
                New User
              </button>
              <button class="btn btn-secondary">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" />
                </svg>
                Generate Report
              </button>
              <button class="btn btn-accent">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                </svg>
                Send Email
              </button>
              <button class="btn btn-info">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
                Settings
              </button>
            </div>

            <!-- Main Content Grid -->
            <div class="grid grid-cols-1 xl:grid-cols-3 gap-6 mb-6">
              <!-- Recent Transactions -->
              <div class="xl:col-span-2">
                <div class="card bg-base-100 shadow-xl">
                  <div class="card-body">
                    <h2 class="card-title">Recent Transactions</h2>
                    
                    <div class="overflow-x-auto">
                      <table class="table">
                        <thead>
                          <tr>
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Date</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>TXN-001</td>
                            <td>John Doe</td>
                            <td class="font-bold text-primary">$1,250</td>
                            <td><span class="badge badge-success">Completed</span></td>
                            <td>2024-07-24</td>
                          </tr>
                          <tr>
                            <td>TXN-002</td>
                            <td>Jane Smith</td>
                            <td class="font-bold text-primary">$890</td>
                            <td><span class="badge badge-warning">Pending</span></td>
                            <td>2024-07-23</td>
                          </tr>
                          <tr>
                            <td>TXN-003</td>
                            <td>Alex Johnson</td>
                            <td class="font-bold text-primary">$2,100</td>
                            <td><span class="badge badge-success">Completed</span></td>
                            <td>2024-07-23</td>
                          </tr>
                          <tr>
                            <td>TXN-004</td>
                            <td>Sarah Wilson</td>
                            <td class="font-bold text-primary">$650</td>
                            <td><span class="badge badge-error">Failed</span></td>
                            <td>2024-07-22</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Activity Feed -->
              <div class="xl:col-span-1">
                <div class="card bg-base-100 shadow-xl">
                  <div class="card-body">
                    <h2 class="card-title">Activity Feed</h2>
                    
                    <ul class="timeline timeline-vertical">
                      <li>
                        <div class="timeline-start timeline-box">
                          <div class="text-sm font-medium">New user registered</div>
                          <div class="text-xs opacity-60">John Doe signed up</div>
                        </div>
                        <div class="timeline-middle">
                          <div class="w-2 h-2 bg-success rounded-full"></div>
                        </div>
                        <div class="timeline-end timeline-box">2h ago</div>
                        <hr class="bg-success" />
                      </li>
                      
                      <li>
                        <hr class="bg-primary" />
                        <div class="timeline-start timeline-box">
                          <div class="text-sm font-medium">Payment received</div>
                          <div class="text-xs opacity-60">$1,250 from customer</div>
                        </div>
                        <div class="timeline-middle">
                          <div class="w-2 h-2 bg-primary rounded-full"></div>
                        </div>
                        <div class="timeline-end timeline-box">4h ago</div>
                        <hr class="bg-secondary" />
                      </li>
                      
                      <li>
                        <hr class="bg-secondary" />
                        <div class="timeline-start timeline-box">
                          <div class="text-sm font-medium">System backup</div>
                          <div class="text-xs opacity-60">Automated backup completed</div>
                        </div>
                        <div class="timeline-middle">
                          <div class="w-2 h-2 bg-secondary rounded-full"></div>
                        </div>
                        <div class="timeline-end timeline-box">1d ago</div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

            <!-- System Controls -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
              <!-- Quick Filters -->
              <div class="card bg-base-100 shadow-xl">
                <div class="card-body">
                  <h2 class="card-title">Filter Options</h2>
                  
                  <div class="form-control mb-4">
                    <label class="label">
                      <span class="label-text">Search</span>
                    </label>
                    <input type="text" placeholder="Search transactions..." class="input input-bordered" />
                  </div>
                  
                  <div class="form-control mb-4">
                    <label class="label">
                      <span class="label-text">Date Range</span>
                    </label>
                    <select class="select select-bordered">
                      <option>Last 7 days</option>
                      <option>Last 30 days</option>
                      <option>Last quarter</option>
                      <option>This year</option>
                    </select>
                  </div>
                  
                  <div class="form-control mb-4">
                    <label class="label">
                      <span class="label-text">Amount: $0 - $5000</span>
                    </label>
                    <input type="range" min="0" max="5000" value="2500" class="range range-primary" />
                  </div>
                  
                  <div class="flex gap-2">
                    <button class="btn btn-primary">Apply</button>
                    <button class="btn btn-ghost">Reset</button>
                  </div>
                </div>
              </div>

              <!-- System Settings -->
              <div class="card bg-base-100 shadow-xl">
                <div class="card-body">
                  <h2 class="card-title">System Settings</h2>
                  
                  <div class="space-y-4">
                    <div class="flex justify-between items-center">
                      <span class="label-text">Maintenance Mode</span>
                      <input type="checkbox" class="toggle toggle-primary" />
                    </div>
                    
                    <div class="flex justify-between items-center">
                      <span class="label-text">Email Notifications</span>
                      <input type="checkbox" class="toggle toggle-secondary" checked />
                    </div>
                    
                    <div class="flex justify-between items-center">
                      <span class="label-text">Auto Backup</span>
                      <input type="checkbox" class="toggle toggle-accent" checked />
                    </div>
                    
                    <div class="flex justify-between items-center">
                      <span class="label-text">Debug Mode</span>
                      <input type="checkbox" class="toggle toggle-warning" />
                    </div>
                  </div>
                  
                  <div class="divider"></div>
                  
                  <div class="flex gap-2">
                    <button class="btn btn-success btn-sm">Save Changes</button>
                    <button class="btn btn-outline btn-sm">Reset</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- Alerts Section -->
            <div class="space-y-4">
              <div class="alert alert-info">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />
                </svg>
                <div>
                  <h3 class="font-bold">System Update Available</h3>
                  <div class="text-xs">Version 2.1.0 includes security patches and performance improvements.</div>
                </div>
                <button class="btn btn-sm btn-primary">Update</button>
              </div>
              
              <div class="alert alert-success">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <div>
                  <h3 class="font-bold">Backup Completed</h3>
                  <div class="text-xs">Daily backup finished successfully at 3:00 AM.</div>
                </div>
              </div>
              
              <div class="alert alert-warning">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
                </svg>
                <div>
                  <h3 class="font-bold">Storage Almost Full</h3>
                  <div class="text-xs">You're using 87% of your storage. Consider upgrading your plan.</div>
                </div>
                <button class="btn btn-sm btn-warning">Upgrade</button>
              </div>
            </div>
          </div>
        </div>

        <!-- Sidebar -->
        <div class="drawer-side">
          <label for="sidebar-toggle" class="drawer-overlay"></label>
          <div class="min-h-full w-64 bg-base-100">
            <!-- Sidebar Header -->
            <div class="p-4 border-b">
              <div class="flex items-center gap-3">
                <div class="avatar">
                  <div class="w-10 rounded bg-primary text-primary-content">
                    <span class="text-lg font-bold">S</span>
                  </div>
                </div>
                <div>
                  <h2 class="font-bold">SaaS Dashboard</h2>
                  <p class="text-sm opacity-70">Business Analytics</p>
                </div>
              </div>
            </div>

            <!-- Sidebar Menu -->
            <ul class="menu p-4 w-full">
              <li class="mb-1">
                <a class="active">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
                  </svg>
                  Dashboard
                </a>
              </li>
              <li class="mb-1">
                <a>
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z" />
                  </svg>
                  Analytics
                </a>
              </li>
              <li class="mb-1">
                <a>
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
                  </svg>
                  Customers
                </a>
              </li>
              <li class="mb-1">
                <a>
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" />
                  </svg>
                  Orders
                </a>
              </li>
              <li class="mb-1">
                <a>
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z" />
                  </svg>
                  Billing
                </a>
              </li>
              <li class="mb-1">
                <details>
                  <summary>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
                      <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    Settings
                  </summary>
                  <ul>
                    <li><a>Profile</a></li>
                    <li><a>Account</a></li>
                    <li><a>Security</a></li>
                    <li><a>API Keys</a></li>
                  </ul>
                </details>
              </li>
            </ul>

            <!-- Sidebar Footer -->
            <div class="p-4 mt-auto">
              <div class="card bg-base-200">
                <div class="card-body p-3">
                  <h3 class="card-title text-sm">Upgrade Plan</h3>
                  <p class="text-xs">Unlock premium features</p>
                  <button class="btn btn-primary btn-sm mt-2">Upgrade</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end