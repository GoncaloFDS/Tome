-- premake5.lua
workspace "Tome"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "Tome"

   -- Workspace-wide build options for MSVC
   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

group "tome_engine"
	include "tome_engine/build_tome_engine.lua"
group ""

include "tome_app/build_tome_app.lua"