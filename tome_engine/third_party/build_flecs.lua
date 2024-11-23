project "flecs"
   kind "StaticLib"
   language "C"
   cdialect "C99"
   targetdir "binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files {
      "flecs/distr/flecs.h",
      "flecs/distr/flecs.c",
   }

   includedirs
   {
      "flecs/include",
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