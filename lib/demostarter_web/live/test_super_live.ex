defmodule DemostarterWeb.TestSuperLive do
  use DemostarterWeb, :live_view
  
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
  
  def render(assigns) do
    ~H"""
    <!-- Main Dashboard Container with gradient background -->
    <div class="min-h-screen bg-gradient-to-br from-base-200 to-base-300">
      <div class="drawer lg:drawer-open">
        <input id="sidebar-toggle" type="checkbox" class="drawer-toggle" />
        
        <!-- Main Content Area -->
        <div class="drawer-content flex flex-col">
          <!-- Top Navigation Bar with glass effect -->
          <div class="navbar bg-base-100/90 backdrop-blur-lg shadow-lg sticky top-0 z-40 transition-all hover:shadow-xl">
            <div class="flex-none lg:hidden">
              <label for="sidebar-toggle" class="btn btn-square btn-ghost transition-all hover-scale">
                <.icon name="hero-bars-3" class="h-6 w-6" />
              </label>
            </div>
            
            <!-- Search Bar with enhanced styling -->
            <div class="flex-1 px-4">
              <div class="form-control max-w-md">
                <div class="relative">
                  <input 
                    type="text" 
                    placeholder="Search anything..." 
                    class="input input-bordered w-full pl-10 transition-all focus:shadow-md focus:border-primary" 
                  />
                  <.icon name="hero-magnifying-glass" class="h-5 w-5 absolute left-3 top-1/2 transform -translate-y-1/2 text-base-content/60" />
                </div>
              </div>
            </div>
            
            <!-- Top Navigation Actions -->
            <div class="navbar-end gap-2">
              <!-- Theme Toggle -->
              <label class="swap swap-rotate btn btn-ghost btn-circle transition-all hover-scale">
                <input type="checkbox" class="theme-controller" value="dark" />
                <.icon name="hero-sun" class="swap-on h-6 w-6" />
                <.icon name="hero-moon" class="swap-off h-6 w-6" />
              </label>
              
              <!-- Notifications with animation -->
              <div class="dropdown dropdown-end">
                <label tabindex="0" class="btn btn-ghost btn-circle transition-all hover-scale">
                  <div class="indicator">
                    <.icon name="hero-bell" class="h-6 w-6" />
                    <span class="badge badge-xs badge-primary indicator-item animate-pulse">5</span>
                  </div>
                </label>
                <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow-xl bg-base-100 rounded-box w-80 transition-all">
                  <li class="menu-title">
                    <span>Recent Notifications</span>
                  </li>
                  <li><a class="transition-all hover:bg-primary/10">
                    <.icon name="hero-user-plus" class="h-5 w-5 text-success" />
                    <div>
                      <p class="font-semibold">New customer registered</p>
                      <p class="text-xs text-base-content/60">Sarah Johnson just signed up</p>
                    </div>
                  </a></li>
                  <li><a class="transition-all hover:bg-primary/10">
                    <.icon name="hero-currency-dollar" class="h-5 w-5 text-primary" />
                    <div>
                      <p class="font-semibold">Payment received</p>
                      <p class="text-xs text-base-content/60">$2,450 from Enterprise Inc.</p>
                    </div>
                  </a></li>
                  <li><a class="transition-all hover:bg-primary/10">
                    <.icon name="hero-chart-bar" class="h-5 w-5 text-warning" />
                    <div>
                      <p class="font-semibold">Weekly report ready</p>
                      <p class="text-xs text-base-content/60">View your performance metrics</p>
                    </div>
                  </a></li>
                </ul>
              </div>
              
              <!-- User Profile with enhanced dropdown -->
              <div class="dropdown dropdown-end">
                <label tabindex="0" class="btn btn-ghost btn-circle avatar transition-all hover-scale">
                  <div class="w-10 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
                    <div class="avatar placeholder">
                      <div class="bg-gradient-to-br from-primary to-secondary text-primary-content rounded-full w-10">
                        <span class="text-sm font-bold">JD</span>
                      </div>
                    </div>
                  </div>
                </label>
                <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow-xl bg-base-100 rounded-box w-52 transition-all">
                  <li class="menu-title">
                    <span>John Doe</span>
                    <span class="text-xs font-normal">john@example.com</span>
                  </li>
                  <li><a class="transition-all hover:bg-primary/10">
                    <.icon name="hero-user-circle" class="h-5 w-5" />
                    Profile
                  </a></li>
                  <li><a class="transition-all hover:bg-primary/10">
                    <.icon name="hero-cog-6-tooth" class="h-5 w-5" />
                    Settings
                  </a></li>
                  <li><a class="transition-all hover:bg-primary/10">
                    <.icon name="hero-credit-card" class="h-5 w-5" />
                    Billing
                  </a></li>
                  <div class="divider my-1"></div>
                  <li><a class="transition-all hover:bg-error/10 text-error">
                    <.icon name="hero-arrow-right-on-rectangle" class="h-5 w-5" />
                    Logout
                  </a></li>
                </ul>
              </div>
            </div>
          </div>

          <!-- Hero Section with animated gradient -->
          <div class="hero bg-gradient-to-r from-primary via-secondary to-accent text-primary-content py-12 animate-gradient-x">
            <div class="hero-content text-center">
              <div class="max-w-2xl">
                <h1 class="text-5xl font-bold mb-6">Welcome back, John!</h1>
                <p class="text-xl mb-8 opacity-90">Your business is growing 24% faster this month</p>
                <div class="flex gap-4 justify-center flex-wrap">
                  <button class="btn btn-lg bg-base-100 text-base-content hover:bg-base-200 transition-all hover-scale shadow-lg">
                    <.icon name="hero-chart-pie" class="h-6 w-6" />
                    View Analytics
                  </button>
                  <button class="btn btn-lg btn-outline border-base-100 text-base-100 hover:bg-base-100 hover:text-base-content transition-all hover-scale">
                    <.icon name="hero-plus-circle" class="h-6 w-6" />
                    Quick Actions
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- Main Dashboard Content -->
          <div class="flex-1 p-6 xl:p-8">
            <!-- Key Metrics Stats with enhanced styling -->
            <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6 mb-8">
              <div class="stat bg-base-100 rounded-2xl shadow-lg transition-all hover-lift hover-shadow-xl p-6">
                <div class="stat-figure text-primary">
                  <div class="bg-primary/10 p-3 rounded-xl">
                    <.icon name="hero-currency-dollar" class="w-8 h-8" />
                  </div>
                </div>
                <div class="stat-title text-base-content/60">Monthly Revenue</div>
                <div class="stat-value text-3xl bg-gradient-to-r from-primary to-secondary bg-clip-text text-transparent">$89,425</div>
                <div class="stat-desc flex items-center gap-1 text-success">
                  <.icon name="hero-arrow-trending-up" class="h-4 w-4" />
                  18% from last month
                </div>
              </div>
              
              <div class="stat bg-base-100 rounded-2xl shadow-lg transition-all hover-lift hover-shadow-xl p-6">
                <div class="stat-figure text-secondary">
                  <div class="bg-secondary/10 p-3 rounded-xl">
                    <.icon name="hero-users" class="w-8 h-8" />
                  </div>
                </div>
                <div class="stat-title text-base-content/60">Active Users</div>
                <div class="stat-value text-3xl">2,847</div>
                <div class="stat-desc flex items-center gap-1 text-success">
                  <.icon name="hero-arrow-trending-up" class="h-4 w-4" />
                  7% this week
                </div>
              </div>
              
              <div class="stat bg-base-100 rounded-2xl shadow-lg transition-all hover-lift hover-shadow-xl p-6">
                <div class="stat-figure text-accent">
                  <div class="bg-accent/10 p-3 rounded-xl">
                    <.icon name="hero-shopping-bag" class="w-8 h-8" />
                  </div>
                </div>
                <div class="stat-title text-base-content/60">Total Orders</div>
                <div class="stat-value text-3xl">1,234</div>
                <div class="stat-desc flex items-center gap-1 text-warning">
                  <.icon name="hero-minus" class="h-4 w-4" />
                  2% from yesterday
                </div>
              </div>
              
              <div class="stat bg-base-100 rounded-2xl shadow-lg transition-all hover-lift hover-shadow-xl p-6">
                <div class="stat-figure text-success">
                  <div class="bg-success/10 p-3 rounded-xl">
                    <.icon name="hero-arrow-trending-up" class="w-8 h-8" />
                  </div>
                </div>
                <div class="stat-title text-base-content/60">Conversion Rate</div>
                <div class="stat-value text-3xl">4.8%</div>
                <div class="stat-desc text-success">Above industry avg</div>
              </div>
            </div>

            <!-- Progress Overview Section -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
              <!-- Revenue Progress Card -->
              <div class="card bg-base-100 shadow-xl transition-all hover-lift hover-shadow-2xl">
                <div class="card-body">
                  <h2 class="card-title text-xl mb-4">
                    <.icon name="hero-chart-bar" class="h-6 w-6 text-primary" />
                    Revenue Goals
                  </h2>
                  <div class="space-y-4">
                    <div>
                      <div class="flex justify-between mb-2">
                        <span class="text-sm font-medium">Q1 Target</span>
                        <span class="text-sm text-primary font-bold">85%</span>
                      </div>
                      <progress class="progress progress-primary transition-all" value="85" max="100"></progress>
                    </div>
                    <div>
                      <div class="flex justify-between mb-2">
                        <span class="text-sm font-medium">Annual Goal</span>
                        <span class="text-sm text-secondary font-bold">62%</span>
                      </div>
                      <progress class="progress progress-secondary transition-all" value="62" max="100"></progress>
                    </div>
                    <div>
                      <div class="flex justify-between mb-2">
                        <span class="text-sm font-medium">Growth Rate</span>
                        <span class="text-sm text-accent font-bold">124%</span>
                      </div>
                      <progress class="progress progress-accent transition-all" value="100" max="100"></progress>
                    </div>
                  </div>
                  <div class="card-actions justify-end mt-4">
                    <button class="btn btn-primary btn-sm transition-all hover-scale">View Details</button>
                  </div>
                </div>
              </div>

              <!-- Performance Metrics -->
              <div class="card bg-base-100 shadow-xl transition-all hover-lift hover-shadow-2xl">
                <div class="card-body">
                  <h2 class="card-title text-xl mb-4">
                    <.icon name="hero-presentation-chart-line" class="h-6 w-6 text-secondary" />
                    Performance Metrics
                  </h2>
                  <div class="flex justify-center items-center py-4">
                    <div class="radial-progress text-primary shadow-lg transition-all hover-scale" style="--value:78; --size:10rem; --thickness: 1rem;">
                      <div class="text-center">
                        <div class="text-3xl font-bold">78%</div>
                        <div class="text-xs opacity-70">Overall Score</div>
                      </div>
                    </div>
                  </div>
                  <div class="grid grid-cols-3 gap-2 text-center">
                    <div class="transition-all hover:bg-base-200 rounded-lg p-2">
                      <div class="text-2xl font-bold text-success">A+</div>
                      <div class="text-xs opacity-70">Grade</div>
                    </div>
                    <div class="transition-all hover:bg-base-200 rounded-lg p-2">
                      <div class="text-2xl font-bold">98%</div>
                      <div class="text-xs opacity-70">Uptime</div>
                    </div>
                    <div class="transition-all hover:bg-base-200 rounded-lg p-2">
                      <div class="text-2xl font-bold text-warning">4.8</div>
                      <div class="text-xs opacity-70">Rating</div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Quick Actions Card -->
              <div class="card bg-gradient-to-br from-primary to-secondary text-primary-content shadow-xl transition-all hover-lift hover-shadow-2xl">
                <div class="card-body">
                  <h2 class="card-title text-xl mb-4 text-primary-content">
                    <.icon name="hero-bolt" class="h-6 w-6" />
                    Quick Actions
                  </h2>
                  <div class="space-y-3">
                    <button class="btn btn-block bg-base-100 text-base-content hover:bg-base-200 transition-all hover-scale">
                      <.icon name="hero-user-plus" class="h-5 w-5" />
                      Add New Customer
                    </button>
                    <button class="btn btn-block btn-outline border-base-100 text-base-100 hover:bg-base-100 hover:text-base-content transition-all hover-scale">
                      <.icon name="hero-document-text" class="h-5 w-5" />
                      Generate Report
                    </button>
                    <button class="btn btn-block btn-outline border-base-100 text-base-100 hover:bg-base-100 hover:text-base-content transition-all hover-scale">
                      <.icon name="hero-paper-airplane" class="h-5 w-5" />
                      Send Campaign
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <!-- Main Content Grid -->
            <div class="grid grid-cols-1 xl:grid-cols-3 gap-6 mb-8">
              <!-- Recent Activity Table -->
              <div class="xl:col-span-2">
                <div class="card bg-base-100 shadow-xl transition-all hover-shadow-2xl">
                  <div class="card-body">
                    <div class="flex justify-between items-center mb-4">
                      <h2 class="card-title text-xl">
                        <.icon name="hero-clock" class="h-6 w-6 text-primary" />
                        Recent Activity
                      </h2>
                      <div class="tabs tabs-boxed bg-base-200">
                        <a class="tab tab-active transition-all">All</a>
                        <a class="tab transition-all hover:bg-base-300">Sales</a>
                        <a class="tab transition-all hover:bg-base-300">Users</a>
                      </div>
                    </div>
                    
                    <div class="overflow-x-auto">
                      <table class="table table-zebra">
                        <thead>
                          <tr>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Time</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="hover transition-all">
                            <td>
                              <div class="badge badge-primary badge-sm">Sale</div>
                            </td>
                            <td>
                              <div class="flex items-center gap-3">
                                <div class="avatar">
                                  <div class="mask mask-circle w-8 h-8 bg-primary/20">
                                    <.icon name="hero-shopping-cart" class="h-5 w-5 text-primary m-auto mt-1.5" />
                                  </div>
                                </div>
                                <div>
                                  <div class="font-semibold">Premium Plan</div>
                                  <div class="text-xs opacity-60">John Smith</div>
                                </div>
                              </div>
                            </td>
                            <td class="font-bold text-success">+$299</td>
                            <td><span class="badge badge-success badge-sm">Completed</span></td>
                            <td class="text-xs opacity-60">2 min ago</td>
                          </tr>
                          <tr class="hover transition-all">
                            <td>
                              <div class="badge badge-secondary badge-sm">User</div>
                            </td>
                            <td>
                              <div class="flex items-center gap-3">
                                <div class="avatar">
                                  <div class="mask mask-circle w-8 h-8 bg-secondary/20">
                                    <.icon name="hero-user-plus" class="h-5 w-5 text-secondary m-auto mt-1.5" />
                                  </div>
                                </div>
                                <div>
                                  <div class="font-semibold">New Registration</div>
                                  <div class="text-xs opacity-60">Emma Wilson</div>
                                </div>
                              </div>
                            </td>
                            <td>-</td>
                            <td><span class="badge badge-info badge-sm">Active</span></td>
                            <td class="text-xs opacity-60">15 min ago</td>
                          </tr>
                          <tr class="hover transition-all">
                            <td>
                              <div class="badge badge-warning badge-sm">System</div>
                            </td>
                            <td>
                              <div class="flex items-center gap-3">
                                <div class="avatar">
                                  <div class="mask mask-circle w-8 h-8 bg-warning/20">
                                    <.icon name="hero-arrow-path" class="h-5 w-5 text-warning m-auto mt-1.5" />
                                  </div>
                                </div>
                                <div>
                                  <div class="font-semibold">Backup Complete</div>
                                  <div class="text-xs opacity-60">Database backup</div>
                                </div>
                              </div>
                            </td>
                            <td>-</td>
                            <td><span class="badge badge-success badge-sm">Success</span></td>
                            <td class="text-xs opacity-60">1 hour ago</td>
                          </tr>
                          <tr class="hover transition-all">
                            <td>
                              <div class="badge badge-error badge-sm">Alert</div>
                            </td>
                            <td>
                              <div class="flex items-center gap-3">
                                <div class="avatar">
                                  <div class="mask mask-circle w-8 h-8 bg-error/20">
                                    <.icon name="hero-credit-card" class="h-5 w-5 text-error m-auto mt-1.5" />
                                  </div>
                                </div>
                                <div>
                                  <div class="font-semibold">Payment Failed</div>
                                  <div class="text-xs opacity-60">Card declined</div>
                                </div>
                              </div>
                            </td>
                            <td class="font-bold text-error">-$150</td>
                            <td><span class="badge badge-error badge-sm">Failed</span></td>
                            <td class="text-xs opacity-60">2 hours ago</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    
                    <div class="card-actions justify-center mt-4">
                      <button class="btn btn-sm btn-ghost transition-all hover-scale">
                        Load More
                        <.icon name="hero-chevron-down" class="h-4 w-4" />
                      </button>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Activity Timeline -->
              <div class="xl:col-span-1">
                <div class="card bg-base-100 shadow-xl transition-all hover-shadow-2xl">
                  <div class="card-body">
                    <h2 class="card-title text-xl mb-4">
                      <.icon name="hero-calendar-days" class="h-6 w-6 text-accent" />
                      Today's Timeline
                    </h2>
                    
                    <ul class="timeline timeline-vertical timeline-compact">
                      <li>
                        <div class="timeline-start timeline-box bg-success/10 text-success border-success">
                          <div class="text-sm font-semibold">Revenue Milestone</div>
                          <div class="text-xs">Hit $50K today!</div>
                        </div>
                        <div class="timeline-middle">
                          <div class="w-3 h-3 bg-success rounded-full animate-pulse"></div>
                        </div>
                        <div class="timeline-end text-xs opacity-60">Just now</div>
                        <hr class="bg-success" />
                      </li>
                      
                      <li>
                        <hr class="bg-primary" />
                        <div class="timeline-start timeline-box bg-primary/10 text-primary border-primary">
                          <div class="text-sm font-semibold">New Feature Live</div>
                          <div class="text-xs">Dashboard v2.0</div>
                        </div>
                        <div class="timeline-middle">
                          <div class="w-3 h-3 bg-primary rounded-full"></div>
                        </div>
                        <div class="timeline-end text-xs opacity-60">2h ago</div>
                        <hr class="bg-secondary" />
                      </li>
                      
                      <li>
                        <hr class="bg-secondary" />
                        <div class="timeline-start timeline-box bg-secondary/10 text-secondary border-secondary">
                          <div class="text-sm font-semibold">Team Meeting</div>
                          <div class="text-xs">Q1 Planning</div>
                        </div>
                        <div class="timeline-middle">
                          <div class="w-3 h-3 bg-secondary rounded-full"></div>
                        </div>
                        <div class="timeline-end text-xs opacity-60">4h ago</div>
                        <hr class="bg-warning" />
                      </li>
                      
                      <li>
                        <hr class="bg-warning" />
                        <div class="timeline-start timeline-box bg-warning/10 text-warning border-warning">
                          <div class="text-sm font-semibold">Maintenance</div>
                          <div class="text-xs">Server update</div>
                        </div>
                        <div class="timeline-middle">
                          <div class="w-3 h-3 bg-warning rounded-full"></div>
                        </div>
                        <div class="timeline-end text-xs opacity-60">6h ago</div>
                      </li>
                    </ul>
                    
                    <div class="divider">Earlier</div>
                    
                    <button class="btn btn-sm btn-outline transition-all hover-scale">
                      View Full History
                      <.icon name="hero-arrow-right" class="h-4 w-4" />
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <!-- Bottom Section with Charts and Controls -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <!-- Sales Chart -->
              <div class="card bg-base-100 shadow-xl transition-all hover-shadow-2xl">
                <div class="card-body">
                  <h2 class="card-title text-xl mb-4">
                    <.icon name="hero-presentation-chart-line" class="h-6 w-6 text-primary" />
                    Sales Overview
                  </h2>
                  
                  <!-- Chart Placeholder using DaisyUI elements -->
                  <div class="space-y-3">
                    <div class="flex items-end justify-between h-48 px-4">
                      <div class="flex flex-col items-center flex-1">
                        <div class="w-full bg-primary/20 rounded-t transition-all hover:bg-primary/30" style="height: 40%"></div>
                        <span class="text-xs mt-2">Mon</span>
                      </div>
                      <div class="flex flex-col items-center flex-1">
                        <div class="w-full bg-primary/20 rounded-t transition-all hover:bg-primary/30" style="height: 60%"></div>
                        <span class="text-xs mt-2">Tue</span>
                      </div>
                      <div class="flex flex-col items-center flex-1">
                        <div class="w-full bg-primary rounded-t transition-all hover:bg-primary/80" style="height: 85%"></div>
                        <span class="text-xs mt-2">Wed</span>
                      </div>
                      <div class="flex flex-col items-center flex-1">
                        <div class="w-full bg-primary/20 rounded-t transition-all hover:bg-primary/30" style="height: 70%"></div>
                        <span class="text-xs mt-2">Thu</span>
                      </div>
                      <div class="flex flex-col items-center flex-1">
                        <div class="w-full bg-primary/20 rounded-t transition-all hover:bg-primary/30" style="height: 90%"></div>
                        <span class="text-xs mt-2">Fri</span>
                      </div>
                      <div class="flex flex-col items-center flex-1">
                        <div class="w-full bg-secondary rounded-t transition-all hover:bg-secondary/80 animate-pulse" style="height: 100%"></div>
                        <span class="text-xs mt-2 font-bold">Today</span>
                      </div>
                      <div class="flex flex-col items-center flex-1">
                        <div class="w-full bg-base-300 rounded-t" style="height: 30%"></div>
                        <span class="text-xs mt-2 opacity-50">Sun</span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="stats stats-horizontal shadow-sm mt-4">
                    <div class="stat px-3 py-2">
                      <div class="stat-title text-xs">Today</div>
                      <div class="stat-value text-lg text-primary">$12.5K</div>
                    </div>
                    <div class="stat px-3 py-2">
                      <div class="stat-title text-xs">This Week</div>
                      <div class="stat-value text-lg text-secondary">$68.3K</div>
                    </div>
                    <div class="stat px-3 py-2">
                      <div class="stat-title text-xs">Growth</div>
                      <div class="stat-value text-lg text-success">+15%</div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Settings & Controls -->
              <div class="card bg-base-100 shadow-xl transition-all hover-shadow-2xl">
                <div class="card-body">
                  <h2 class="card-title text-xl mb-4">
                    <.icon name="hero-adjustments-horizontal" class="h-6 w-6 text-secondary" />
                    Dashboard Settings
                  </h2>
                  
                  <div class="space-y-4">
                    <div class="form-control">
                      <label class="label cursor-pointer">
                        <span class="label-text font-medium">Real-time Updates</span>
                        <input type="checkbox" class="toggle toggle-primary transition-all" checked />
                      </label>
                    </div>
                    
                    <div class="form-control">
                      <label class="label cursor-pointer">
                        <span class="label-text font-medium">Email Notifications</span>
                        <input type="checkbox" class="toggle toggle-secondary transition-all" checked />
                      </label>
                    </div>
                    
                    <div class="form-control">
                      <label class="label cursor-pointer">
                        <span class="label-text font-medium">Show Revenue</span>
                        <input type="checkbox" class="toggle toggle-accent transition-all" checked />
                      </label>
                    </div>
                    
                    <div class="divider">Data Range</div>
                    
                    <div class="form-control">
                      <label class="label">
                        <span class="label-text">Select Period</span>
                      </label>
                      <select class="select select-bordered transition-all focus:border-primary">
                        <option>Last 7 days</option>
                        <option selected>Last 30 days</option>
                        <option>Last Quarter</option>
                        <option>This Year</option>
                        <option>All Time</option>
                      </select>
                    </div>
                    
                    <div class="card-actions justify-end mt-6">
                      <button class="btn btn-ghost btn-sm transition-all hover-scale">Reset</button>
                      <button class="btn btn-primary btn-sm transition-all hover-scale">
                        <.icon name="hero-check" class="h-4 w-4" />
                        Apply
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Footer -->
          <footer class="footer footer-center p-4 bg-base-300 text-base-content">
            <div>
              <p>Copyright © 2024 - SaaS Dashboard Pro</p>
            </div>
          </footer>
        </div>

        <!-- Sidebar -->
        <div class="drawer-side z-50">
          <label for="sidebar-toggle" class="drawer-overlay"></label>
          <aside class="min-h-full w-72 bg-base-100 shadow-2xl">
            <!-- Sidebar Header -->
            <div class="sticky top-0 z-20 bg-base-100/95 backdrop-blur-md border-b border-base-300">
              <div class="p-4">
                <div class="flex items-center gap-3">
                  <div class="avatar">
                    <div class="w-12 rounded-xl bg-gradient-to-br from-primary to-secondary p-2">
                      <.icon name="hero-cube-transparent" class="h-full w-full text-primary-content" />
                    </div>
                  </div>
                  <div>
                    <h2 class="text-xl font-bold bg-gradient-to-r from-primary to-secondary bg-clip-text text-transparent">
                      SaaS Pro
                    </h2>
                    <p class="text-xs opacity-70">Business Analytics Suite</p>
                  </div>
                </div>
              </div>
            </div>

            <!-- Sidebar Navigation -->
            <div class="h-full overflow-y-auto">
              <ul class="menu p-4 text-base-content">
                <!-- Main Menu -->
                <li class="menu-title">
                  <span>Main Menu</span>
                </li>
                <li>
                  <a class="active transition-all hover-scale">
                    <.icon name="hero-home" class="h-5 w-5" />
                    Dashboard
                    <span class="badge badge-primary badge-sm">New</span>
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-chart-pie" class="h-5 w-5" />
                    Analytics
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-users" class="h-5 w-5" />
                    Customers
                    <span class="badge badge-ghost badge-sm">2,847</span>
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-shopping-bag" class="h-5 w-5" />
                    Orders
                    <span class="badge badge-warning badge-sm">12</span>
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-cube" class="h-5 w-5" />
                    Products
                  </a>
                </li>
                
                <!-- Management -->
                <li class="menu-title mt-4">
                  <span>Management</span>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-credit-card" class="h-5 w-5" />
                    Billing
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-megaphone" class="h-5 w-5" />
                    Marketing
                  </a>
                </li>
                <li>
                  <details>
                    <summary class="transition-all hover:bg-base-200">
                      <.icon name="hero-document-text" class="h-5 w-5" />
                      Reports
                    </summary>
                    <ul>
                      <li><a class="transition-all hover:bg-base-200">Sales Report</a></li>
                      <li><a class="transition-all hover:bg-base-200">User Report</a></li>
                      <li><a class="transition-all hover:bg-base-200">Revenue Report</a></li>
                    </ul>
                  </details>
                </li>
                
                <!-- Settings -->
                <li class="menu-title mt-4">
                  <span>Settings</span>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-user-circle" class="h-5 w-5" />
                    Profile
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-cog-6-tooth" class="h-5 w-5" />
                    Preferences
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-shield-check" class="h-5 w-5" />
                    Security
                  </a>
                </li>
                <li>
                  <a class="transition-all hover:bg-base-200">
                    <.icon name="hero-puzzle-piece" class="h-5 w-5" />
                    Integrations
                  </a>
                </li>
              </ul>
              
              <!-- Upgrade Card -->
              <div class="p-4 mt-auto sticky bottom-0 bg-base-100">
                <div class="card bg-gradient-to-br from-primary to-secondary text-primary-content">
                  <div class="card-body p-4">
                    <h3 class="card-title text-base text-primary-content">Upgrade to Pro</h3>
                    <p class="text-xs opacity-90">Unlock advanced analytics and unlimited users</p>
                    <div class="card-actions">
                      <button class="btn btn-sm bg-base-100 text-base-content hover:bg-base-200 transition-all hover-scale">
                        Upgrade Now
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </aside>
        </div>
      </div>
    </div>

    <style>
      @keyframes gradient-x {
        0%, 100% {
          background-size: 200% 200%;
          background-position: left center;
        }
        50% {
          background-size: 200% 200%;
          background-position: right center;
        }
      }
      .animate-gradient-x {
        animation: gradient-x 15s ease infinite;
      }
    </style>
    """
  end
end