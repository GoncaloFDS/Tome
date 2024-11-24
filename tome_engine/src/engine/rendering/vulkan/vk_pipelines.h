#pragma once 
#include <slang/slang-com-ptr.h>

#include "vk_types.h"

namespace vk {
 std::optional<VkShaderModule> LoadShaderModule(const char* shaderFileName, VkDevice device, Slang::ComPtr<slang::ISession> slangSession);


};