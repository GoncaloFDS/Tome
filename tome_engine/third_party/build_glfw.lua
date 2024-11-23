project "glfw"
   kind "StaticLib"
   language "C"
   targetdir "binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files {
      "glfw/include/**.h",
      "glfw/src/**.h",
      "glfw/src/**.c",
   }

   includedirs
   {
--       "glfw/include",
   }

   targetdir ("../../binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../../binaries/intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines {
           "_GLFW_WIN32",
		   "_CRT_SECURE_NO_WARNINGS"
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
