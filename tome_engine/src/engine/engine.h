#pragma once

#include "rendering/vulkan/vk_types.h"

struct DeletionQueue {
    std::deque<std::function<void()>> deletors;

    void PushFunction(std::function<void()>&& function) {
        deletors.push_back(function);
    }

    void Flush() {
        for (const std::function<void()>& deletor : deletors ) {
            deletor();
        }
        deletors.clear();
    }
};

struct FrameData {
    VkCommandPool commandPool;
    VkCommandBuffer mainCommandBuffer;
    VkSemaphore swapchainSemaphore;
    VkSemaphore renderSemaphore;
    VkFence renderFence;
    DeletionQueue deletionQueue;
};

constexpr unsigned int FRAME_OVERLAP = 2;

class Engine {
public:
    static Engine& Get();

    void Init();

    void Cleanup();

    void Draw();

    void Run();

private:
    bool _isInitialized = false;
    int _frameNumber = 0;
    bool _shouldStopRendering = false;
    VkExtent2D _windowExtent = {1700, 900};

    struct GLFWwindow* _window = nullptr;

    VkInstance _instance = nullptr;
    VkDebugUtilsMessengerEXT _debugMessenger = nullptr;
    VkPhysicalDevice _chosenGpu = nullptr;
    VkDevice _device = nullptr;
    VkSurfaceKHR _surface = nullptr;

    VkSwapchainKHR _swapchain = nullptr;
    VkFormat _swapchainImageFormat = VK_FORMAT_R8G8B8A8_SRGB;

    std::vector<VkImage> _swapchainImages;
    std::vector<VkImageView> _swapchainImageViews;
    VkExtent2D _swapchainExtent = {800, 600};

    FrameData _frames[FRAME_OVERLAP] = {};
    VkQueue _graphicsQueue = nullptr;
    uint32_t _graphicsQueueFamily = 0;

    DeletionQueue _deletionQueue;

    VmaAllocator _allocator = nullptr;

    AllocatedImage _drawImage = {};
    VkExtent2D _drawExtent = {};

    void InitVulkan();
    void InitSwapchain();
    void InitCommands();
    void InitSyncStructures();

    void CreateSwapchain(uint32_t width, uint32_t height);
    void DestroySwapchain();

    FrameData& GetCurrentFrame() { return _frames[_frameNumber % FRAME_OVERLAP]; }

    void DrawBackground(VkCommandBuffer cmd);
};
