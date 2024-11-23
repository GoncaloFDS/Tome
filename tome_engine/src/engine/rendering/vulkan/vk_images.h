
#pragma once

#include <vulkan/vulkan.h>

namespace vk {

void TransitionImage(VkCommandBuffer cmd, VkImage image, VkImageLayout currentLayout, VkImageLayout newLayout);


};