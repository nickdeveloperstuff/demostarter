defmodule DemostarterWeb.UiComponentsLive do
  use DemostarterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8">
      <h1 class="text-3xl font-bold mb-8">UI Components Showcase</h1>
      
    <!-- Core Phoenix LiveView Components -->
      <section class="mb-12">
        <h2 class="text-2xl font-bold mb-6">Core Phoenix LiveView Components</h2>

        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Flash Messages</h3>
          <.flash kind={:info}>This is an info flash message</.flash>
          <.flash kind={:error}>This is an error flash message</.flash>
        </div>

        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Buttons</h3>
          <div class="space-x-4">
            <.button>Default Button</.button>
            <.button variant="primary">Primary Button</.button>
          </div>
        </div>

        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Input</h3>
          <.input name="sample" label="Sample Input" value="Demo value" />
        </div>

        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Header</h3>
          <.header>Sample Page Header</.header>
        </div>

        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Table</h3>
          <.table
            id="sample-table"
            rows={[
              %{id: 1, name: "John Doe", email: "john@example.com"},
              %{id: 2, name: "Jane Smith", email: "jane@example.com"}
            ]}
          >
            <:col :let={row} label="Name">{row.name}</:col>
            <:col :let={row} label="Email">{row.email}</:col>
          </.table>
        </div>

        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">List</h3>
          <.list>
            <:item title="Item 1">Description for item 1</:item>
            <:item title="Item 2">Description for item 2</:item>
            <:item title="Item 3">Description for item 3</:item>
          </.list>
        </div>

        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Icons</h3>
          <div class="flex space-x-4">
            <.icon name="hero-home" class="w-6 h-6" />
            <.icon name="hero-user" class="w-6 h-6" />
            <.icon name="hero-heart" class="w-6 h-6" />
            <.icon name="hero-star" class="w-6 h-6" />
          </div>
        </div>
      </section>
      
    <!-- DaisyUI Components -->
      <section class="mb-12">
        <h2 class="text-2xl font-bold mb-6">DaisyUI Components</h2>
        
    <!-- Layout Components -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Layout Components</h3>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Divider</h4>
            <div class="divider">Sample Divider</div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Hero</h4>
            <div class="hero min-h-[200px] bg-base-200">
              <div class="hero-content text-center">
                <div class="max-w-md">
                  <h1 class="text-3xl font-bold">Hello there</h1>
                  <p class="py-6">Sample hero section content</p>
                </div>
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Indicator</h4>
            <div class="indicator">
              <span class="indicator-item badge badge-secondary">New</span>
              <div class="bg-base-300 w-32 h-32 rounded flex items-center justify-center">
                Content
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Join</h4>
            <div class="join">
              <button class="btn join-item">Button</button>
              <button class="btn join-item">Button</button>
              <button class="btn join-item">Button</button>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Stack</h4>
            <div class="stack">
              <div class="bg-primary text-primary-content w-20 h-20 rounded flex items-center justify-center">
                1
              </div>
              <div class="bg-accent text-accent-content w-20 h-20 rounded flex items-center justify-center">
                2
              </div>
              <div class="bg-secondary text-secondary-content w-20 h-20 rounded flex items-center justify-center">
                3
              </div>
            </div>
          </div>
        </div>
        
    <!-- Navigation Components -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Navigation Components</h3>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Breadcrumbs</h4>
            <div class="breadcrumbs text-sm">
              <ul>
                <li><a>Home</a></li>
                <li><a>Documents</a></li>
                <li>Add Document</li>
              </ul>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Link</h4>
            <a class="link">Sample Link</a>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Menu</h4>
            <ul class="menu bg-base-200 w-56 rounded-box">
              <li><a>Item 1</a></li>
              <li><a>Item 2</a></li>
              <li><a>Item 3</a></li>
            </ul>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Pagination</h4>
            <div class="join">
              <button class="join-item btn">1</button>
              <button class="join-item btn">2</button>
              <button class="join-item btn btn-active">3</button>
              <button class="join-item btn">4</button>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Steps</h4>
            <ul class="steps">
              <li class="step step-primary">Register</li>
              <li class="step step-primary">Choose plan</li>
              <li class="step">Purchase</li>
              <li class="step">Receive Product</li>
            </ul>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Tabs</h4>
            <div role="tablist" class="tabs tabs-lifted">
              <a role="tab" class="tab">Tab 1</a>
              <a role="tab" class="tab tab-active">Tab 2</a>
              <a role="tab" class="tab">Tab 3</a>
            </div>
          </div>
        </div>
        
    <!-- Data Display Components -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Data Display Components</h3>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Avatar</h4>
            <div class="avatar">
              <div class="w-16 rounded">
                <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Badge</h4>
            <div class="space-x-2">
              <div class="badge">Default</div>
              <div class="badge badge-primary">Primary</div>
              <div class="badge badge-secondary">Secondary</div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Card</h4>
            <div class="card w-96 bg-base-100 shadow-xl">
              <div class="card-body">
                <h2 class="card-title">Card Title</h2>
                <p>Sample card content goes here</p>
                <div class="card-actions justify-end">
                  <button class="btn btn-primary">Action</button>
                </div>
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Chat</h4>
            <div class="chat chat-start">
              <div class="chat-bubble">Hello there!</div>
            </div>
            <div class="chat chat-end">
              <div class="chat-bubble">Hi! How are you?</div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Collapse</h4>
            <div class="collapse bg-base-200">
              <input type="checkbox" />
              <div class="collapse-title text-xl font-medium">
                Click me to show/hide content
              </div>
              <div class="collapse-content">
                <p>This is the hidden content</p>
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Countdown</h4>
            <div class="grid grid-flow-col gap-5 text-center auto-cols-max">
              <div class="flex flex-col">
                <span class="countdown font-mono text-5xl">
                  <span style="--value:15;"></span>
                </span>
                Days
              </div>
              <div class="flex flex-col">
                <span class="countdown font-mono text-5xl">
                  <span style="--value:10;"></span>
                </span>
                Hours
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Kbd</h4>
            <kbd class="kbd">Ctrl</kbd>
            + <kbd class="kbd">Shift</kbd>
            + <kbd class="kbd">Del</kbd>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Stat</h4>
            <div class="stats shadow">
              <div class="stat">
                <div class="stat-title">Total Page Views</div>
                <div class="stat-value">89,400</div>
                <div class="stat-desc">21% more than last month</div>
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Timeline</h4>
            <ul class="timeline timeline-snap-icon max-md:timeline-compact timeline-vertical">
              <li>
                <div class="timeline-middle">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                    class="h-5 w-5"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.236 4.53L8.193 10.6a.75.75 0 00-1.06 1.061l1.5 1.5a.75.75 0 001.137-.089l4-5.5z"
                      clip-rule="evenodd"
                    />
                  </svg>
                </div>
                <div class="timeline-start mb-10 md:text-end">
                  <time class="font-mono italic">1984</time>
                  <div class="text-lg font-black">First Macintosh computer</div>
                </div>
                <hr />
              </li>
              <li>
                <hr />
                <div class="timeline-middle">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                    class="h-5 w-5"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.236 4.53L8.193 10.6a.75.75 0 00-1.06 1.061l1.5 1.5a.75.75 0 001.137-.089l4-5.5z"
                      clip-rule="evenodd"
                    />
                  </svg>
                </div>
                <div class="timeline-end mb-10">
                  <time class="font-mono italic">1998</time>
                  <div class="text-lg font-black">iMac</div>
                </div>
                <hr />
              </li>
            </ul>
          </div>
        </div>
        
    <!-- Actions Components -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Actions Components</h3>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Button</h4>
            <div class="space-x-2">
              <button class="btn">Default</button>
              <button class="btn btn-primary">Primary</button>
              <button class="btn btn-secondary">Secondary</button>
              <button class="btn btn-accent">Accent</button>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Dropdown</h4>
            <div class="dropdown">
              <div tabindex="0" role="button" class="btn m-1">Click</div>
              <ul
                tabindex="0"
                class="dropdown-content menu bg-base-100 rounded-box z-[1] w-52 p-2 shadow"
              >
                <li><a>Item 1</a></li>
                <li><a>Item 2</a></li>
              </ul>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Swap</h4>
            <label class="swap">
              <input type="checkbox" />
              <div class="swap-on">😈</div>
              <div class="swap-off">😇</div>
            </label>
          </div>
        </div>
        
    <!-- Form Components -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Form Components</h3>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Checkbox</h4>
            <input type="checkbox" checked="checked" class="checkbox" />
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">File Input</h4>
            <input type="file" class="file-input file-input-bordered w-full max-w-xs" />
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Input</h4>
            <input type="text" placeholder="Type here" class="input input-bordered w-full max-w-xs" />
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Radio</h4>
            <div class="form-control">
              <label class="label cursor-pointer">
                <span class="label-text">Option 1</span>
                <input type="radio" name="radio-10" class="radio checked:bg-red-500" checked />
              </label>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Range</h4>
            <input type="range" min="0" max="100" value="40" class="range" />
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Rating</h4>
            <div class="rating">
              <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
              <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" checked />
              <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
              <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
              <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Select</h4>
            <select class="select select-bordered w-full max-w-xs">
              <option disabled selected>Pick your favorite Simpson</option>
              <option>Homer</option>
              <option>Marge</option>
              <option>Bart</option>
              <option>Lisa</option>
            </select>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Textarea</h4>
            <textarea class="textarea textarea-bordered" placeholder="Bio"></textarea>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Toggle</h4>
            <input type="checkbox" class="toggle" checked />
          </div>
        </div>
        
    <!-- Feedback Components -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Feedback Components</h3>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Alert</h4>
            <div class="alert alert-info">
              <span>Info alert message</span>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Loading</h4>
            <span class="loading loading-spinner loading-lg"></span>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Progress</h4>
            <progress class="progress w-56" value="32" max="100"></progress>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Radial Progress</h4>
            <div class="radial-progress" style="--value:70;" role="progressbar">70%</div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Skeleton</h4>
            <div class="flex w-52 flex-col gap-4">
              <div class="skeleton h-32 w-full"></div>
              <div class="skeleton h-4 w-28"></div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Tooltip</h4>
            <div class="tooltip" data-tip="hello">
              <button class="btn">Hover me</button>
            </div>
          </div>
        </div>
        
    <!-- Mockup Components -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-4">Mockup Components</h3>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Browser</h4>
            <div class="mockup-browser border bg-base-300">
              <div class="mockup-browser-toolbar">
                <div class="input">https://daisyui.com</div>
              </div>
              <div class="flex justify-center px-4 py-16 bg-base-200">Hello!</div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Code</h4>
            <div class="mockup-code">
              <pre data-prefix="$"><code>npm i daisyui</code></pre>
              <pre data-prefix=">" class="text-warning"><code>installing...</code></pre>
              <pre data-prefix=">" class="text-success"><code>Done!</code></pre>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Phone</h4>
            <div class="mockup-phone">
              <div class="camera"></div>
              <div class="display">
                <div class="artboard artboard-demo phone-1">Hi.</div>
              </div>
            </div>
          </div>

          <div class="mb-4">
            <h4 class="font-medium mb-2">Window</h4>
            <div class="mockup-window border bg-base-300">
              <div class="flex justify-center px-4 py-16 bg-base-200">Hello!</div>
            </div>
          </div>
        </div>
      </section>
    </div>
    """
  end
end
