const gui = @import("gui.zig");

pub fn init(
    window: *const anyopaque, // zsdl.Window
    renderer: *const anyopaque, // zsdl.Renderer
) void {
    if (!ImGui_ImplSDL2_InitForSDLRenderer(window, renderer))
        unreachable;

    if (!ImGui_ImplSDLRenderer2_Init(renderer))
        unreachable;
}

pub fn processEvent(event: *const anyopaque) bool {
    return ImGui_ImplSDL2_ProcessEvent(event);
}

pub fn deinit() void {
    ImGui_ImplSDLRenderer2_Shutdown();
    ImGui_ImplSDL2_Shutdown();
}

pub fn newFrame() void {
    ImGui_ImplSDLRenderer2_NewFrame();
    ImGui_ImplSDL2_NewFrame();
}

pub fn draw(draw_data: *const anyopaque, renderer: *const anyopaque) void {
    ImGui_ImplSDLRenderer2_RenderDrawData(draw_data, renderer);
}

// Those functions are defined in `imgui_impl_sdl2.cpp`
// (they include few custom changes).
// extern fn ImGui_ImplSDL2_InitForOpenGL(SDL_Window* window, void* sdl_gl_context) bool;
// extern fn ImGui_ImplSDL2_InitForVulkan(SDL_Window* window) bool;
// extern fn ImGui_ImplSDL2_InitForD3D(SDL_Window* window) bool;
// extern fn ImGui_ImplSDL2_InitForMetal(SDL_Window* window) bool;
extern fn ImGui_ImplSDL2_InitForSDLRenderer(window: *const anyopaque, renderer: *const anyopaque) bool;
// extern fn ImGui_ImplSDL2_InitForOther(SDL_Window* window) bool;
extern fn ImGui_ImplSDL2_NewFrame() void;
extern fn ImGui_ImplSDL2_ProcessEvent(event: *const anyopaque) bool;
extern fn ImGui_ImplSDL2_Shutdown() void;

extern fn ImGui_ImplSDLRenderer2_Init(renderer: *const anyopaque) bool;
extern fn ImGui_ImplSDLRenderer2_Shutdown() void;
extern fn ImGui_ImplSDLRenderer2_NewFrame() void;
extern fn ImGui_ImplSDLRenderer2_RenderDrawData(draw_data: *const anyopaque, renderer: *const anyopaque) void;
// extern fn ImGui_ImplSDLRenderer2_CreateFontsTexture() bool;
// extern fn ImGui_ImplSDLRenderer2_DestroyFontsTexture() void;
// extern fn ImGui_ImplSDLRenderer2_CreateDeviceObjects() bool;
// extern fn ImGui_ImplSDLRenderer2_DestroyDeviceObjects() void;
