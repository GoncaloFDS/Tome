project "vk-bootstrap"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   targetdir "binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files {
      "vk-bootstrap/src/**.cpp",
      "vk-bootstrap/src/**.h",
   }

   includedirs
   {
	  "$(VULKAN_SDK)/include"
   }

   links {
      "$(VULKAN_SDK)/lib/vulkan-1.lib"
   }

   targetdir ("../../binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../../binaries/intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"