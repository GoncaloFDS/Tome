project "spdlog"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   targetdir "binaries/%{cfg.buildcfg}"
   staticruntime "off"

   defines {
       "SPDLOG_COMPILED_LIB"
   }

   files {
      "spdlog/include/**.h",
      "spdlog/src/**.cpp",
   }

   includedirs
   {
      "spdlog/include",
   }

   targetdir ("../../binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../../binaries/intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { }
       buildoptions {
           "/utf-8"
       }

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
