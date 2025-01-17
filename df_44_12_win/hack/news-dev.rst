DFHack 0.44.12-r2
=================

New Plugins
-----------
- `debug`: manages runtime debug print category filtering
- `nestboxes`: automatically scan for and forbid fertile eggs incubating in a nestbox

New Scripts
-----------
- `devel/query`: searches for field names in DF objects
- `extinguish`: puts out fires
- `tame`: sets tamed/trained status of animals

Fixes
-----
- `building-hacks`: fixed error when dealing with custom animation tables
- `devel/test-perlin`: fixed Lua error (``math.pow()``)
- `embark-assistant`: fixed crash when entering finder with a 16x16 embark selected, and added 16 to dimension choices
- `embark-skills`: fixed missing ``skill_points_remaining`` field
- `full-heal`:

    - stopped wagon resurrection
    - fixed a minor issue with post-resurrection hostility

- `gui/companion-order`:

    - fixed issues with printing coordinates
    - fixed issues with move command
    - fixed cheat commands (and removed "Power up", which was broken)

- `gui/gm-editor`: fixed reinterpret cast (``r``)
- `gui/pathable`: fixed error when sidebar is hidden with ``Tab``
- `labormanager`:

    - stopped assigning labors to ineligible dwarves, pets, etc.
    - stopped assigning invalid labors
    - added support for crafting jobs that use pearl
    - fixed issues causing cleaning jobs to not be assigned
    - added support for disabling management of specific labors

- `prospector`: (also affected `embark-tools`) - fixed a crash when prospecting an unusable site (ocean, mountains, etc.) with a large default embark size in d_init.txt (e.g. 16x16)
- `siege-engine`: fixed a few Lua errors (``math.pow()``, ``unit.relationship_ids``)
- `tweak`: fixed ``hotkey-clear``

Misc Improvements
-----------------
- `armoks-blessing`: improved documentation to list all available arguments
- `devel/export-dt-ini`:

    - added viewscreen offsets for DT 40.1.2
    - added item base flags offset
    - added needs offsets

- `embark-assistant`:

    - added match indicator display on the right ("World") map
    - changed 'c'ancel to abort find if it's under way and clear results if not, allowing use of partial surveys.
    - added Coal as a search criterion, as well as a coal indication as current embark selection info.

- `full-heal`:

    - added ``-all``, ``-all_civ`` and ``-all_citizens`` arguments
    - added module support
    - now removes historical figure death dates and ghost data

- `growcrops`: added ``all`` argument to grow all crops
- `gui/load-screen`: improved documentation
- `labormanager`: now takes nature value into account when assigning jobs
- `open-legends`: added warning about risk of save corruption and improved related documentation
- `points`: added support when in ``viewscreen_setupdwarfgamest`` and improved error messages
- `siren`: removed break handling (relevant ``misc_trait_type`` was no longer used - see "Structures" section)

API
---
- New debug features related to `debug` plugin:

    - Classes (C++ only): ``Signal<Signature, type_tag>``, ``DebugCategory``, ``DebugManager``
    - Macros: ``TRACE``, ``DEBUG``, ``INFO``, ``WARN``, ``ERR``, ``DBG_DECLARE``, ``DBG_EXTERN``


Internals
---------
- Linux/macOS: changed recommended build backend from Make to Ninja (Make builds will be significantly slower now)
- Added a usable unit test framework for basic tests, and a few basic tests
- Core: various thread safety and memory management improvements
- Fixed CMake build dependencies for generated header files
- Fixed custom ``CMAKE_CXX_FLAGS`` not being passed to plugins
- Changed ``plugins/CMakeLists.custom.txt`` to be ignored by git and created (if needed) at build time instead
- Added ``CMakeSettings.json`` with intellisense support

Lua
---
- ``utils``: new ``OrderedTable`` class

Structures
----------
- Win32: added missing vtables for ``viewscreen_storesst`` and ``squad_order_rescue_hfst``
- ``activity_event_performancest``: renamed poem as written_content_id
- ``dance_form``: named musical_form_id and musical_written_content_id
- ``incident_sub6_performance.participants``: named performance_event and role_index
- ``incident_sub6_performance``: made performance_event an enum
- ``incident_sub6_performance``: named poetic_form_id, musical_form_id, and dance_form_id
- ``musical_form_instruments``: named minimum_required and maximum_permitted
- ``musical_form``: named voices field
- ``poetic_form``: identified many fields and related enum/bitfield types
- ``setup_character_info``: identified ``skill_points_remaining`` (for `embark-skills`)
- ``unit_thought_type``: added new expulsion thoughts from 0.44.12
- ``viewscreen_layer_militaryst``: identified ``equip.assigned.assigned_items``
- ``world_data``: added ``mountain_peak_flags`` type, including ``is_volcano``
- ``written_content``: named poetic_form
- ``unit_action.attack``: identified ``attack_skill``
- ``unit_action.attack``: added ``lightly_tap`` and ``spar_report`` flags
- ``misc_trait_type``: removed ``LikesOutdoors``, ``Hardened``, ``TimeSinceBreak``, ``OnBreak`` (all unused by DF)
- ``unit_personality``: identified ``stress_drain``, ``stress_boost``, ``likes_outdoors``, ``combat_hardened``
- ``plant_tree_tile``: gave connection bits more meaningful names (e.g. ``connection_east`` instead of ``thick_branches_1``)
- ``plant_tree_info``: identified ``extent_east``, etc.
- ``ui``: fixed alignment of ``main`` and ``squads`` (fixes `tweak` hotkey-clear and DF-AI)
- ``ui.main``: identified ``fortress_site``
- ``ui.squads``: identified ``kill_rect_targets_scroll``
- ``world_site``: identified names and/or types of some fields
- ``world_history``: identified names and/or types of some fields
- ``viewscreen_setupadventurest``: identified some nemesis and personality fields, and ``page.ChooseHistfig``
- ``unit_storage_status``: newly identified type, stores noble holdings information (used in ``viewscreen_layer_noblelistst``)
- ``viewscreen_layer_noblelistst``: identified ``storage_status`` (see ``unit_storage_status`` type)
- ``viewscreen_layer_arena_creaturest``: identified item- and name-related fields
- ``viewscreen_new_regionst``: identified ``rejection_msg``, ``raw_folder``, ``load_world_params``
- ``viewscreen_new_regionst``: changed many ``int8_t`` fields to ``bool``
- ``unit_flags3``: identified ``marked_for_gelding``
- ``body_part_status``: identified ``gelded``


DFHack 0.44.12-r1
=================

Fixes
-----
- Console: fixed crash when entering long commands on Linux/macOS
- Removed jsoncpp's ``include`` and ``lib`` folders from DFHack builds/packages
- Fixed special characters in `command-prompt` and other non-console in-game outputs on Linux/macOS (in tools using ``df2console``)
- `die`: fixed Windows crash in exit handling
- `dwarfmonitor`, `manipulator`: fixed stress cutoffs
- `modtools/force`: fixed a bug where the help text would always be displayed and nothing useful would happen
- `ruby`: fixed calling conventions for vmethods that return strings (currently ``enabler.GetKeyDisplay()``)
- `startdwarf`: fixed on 64-bit Linux

Misc Improvements
-----------------
- Reduced time for designation jobs from tools like `digv` to be assigned workers
- `embark-assistant`:

    - Switched to standard scrolling keys, improved spacing slightly
    - Introduced scrolling of Finder search criteria, removing requirement for 46 lines to work properly (Help/Info still formatted for 46 lines).
    - Added Freezing search criterion, allowing searches for NA/Frozen/At_Least_Partial/Partial/At_Most_Partial/Never Freezing embarks.

- `rejuvenate`:

    - Added ``-all`` argument to apply to all citizens
    - Added ``-force`` to include units under 20 years old
    - Clarified documentation


API
---
- Added to ``Units`` module:

    - ``getStressCategory(unit)``
    - ``getStressCategoryRaw(level)``
    - ``stress_cutoffs`` (Lua: ``getStressCutoffs()``)


Internals
---------
- Changed default build architecture to 64-bit
- Added documentation for all RPC functions and a build-time check
- Added support for build IDs to development builds
- Use ``dlsym(3)`` to find vtables from libgraphics.so

Structures
----------
- Added ``start_dwarf_count`` on 64-bit Linux again and fixed scanning script
- ``army_controller``: added new vector from 0.44.11
- ``viewscreen_civlistst``: split ``unk_20`` into 3 pointers
- ``belief_system``: new type, few fields identified
- ``mental_picture``: new type, some fields identified
- ``mission``: new type (used in ``viewscreen_civlistst``)
- ``mission_report``:

    - new type (renamed, was ``mission`` before)
    - identified some fields

- ``spoils_report``: new type, most fields identified
- ``viewscreen_civlistst``:

    - identified new pages
    - identified new messenger-related fields

- ``viewscreen_image_creatorst``:

    - fixed layout
    - identified many fields

- ``viewscreen_reportlistst``: added new mission and spoils report-related fields (fixed layout)
- ``world``: ``belief_systems``: identified
- ``world.languages``: identified (minimal information; whole languages stored elsewhere)
- ``world.status``:

    - ``mission_reports``: renamed, was ``missions``
    - ``spoils_reports``: identified

- ``world.unk_131ec0``, ``world.unk_131ef0``: researched layout
- ``world.worldgen_status``: identified many fields


DFHack 0.44.12-alpha1
=====================

Fixes
-----
- macOS: fixed ``renderer`` vtable address on x64 (fixes `rendermax`)
- `stonesense`: fixed ``PLANT:DESERT_LIME:LEAF`` typo

API
---
- Added C++-style linked list interface for DF linked lists

Structures
----------
- Dropped 0.44.11 support
- ``ui.squads``: Added fields new in 0.44.12


DFHack 0.44.11-beta2.1
======================

Internals
---------
- `stonesense`: fixed build


DFHack 0.44.11-beta2
====================

Fixes
-----
- Windows: Fixed console failing to initialize
- `command-prompt`: added support for commands that require a specific screen to be visible, e.g. `spotclean`
- `gui/workflow`: fixed advanced constraint menu for crafts

API
---
- Added ``Screen::Hide`` to temporarily hide screens, like `command-prompt`


DFHack 0.44.11-beta1
====================

Fixes
-----
- Fixed displayed names (from ``Units::getVisibleName``) for units with identities
- Fixed potential memory leak in ``Screen::show()``
- `fix/dead-units`: fixed script trying to use missing isDiplomat function

Misc Improvements
-----------------
- Console:

    - added support for multibyte characters on Linux/macOS
    - made the console exit properly when an interactive command is active (`liquids`, `mode`, `tiletypes`)

- Made the ``DFHACK_PORT`` environment variable take priority over ``remote-server.json``
- Linux: added automatic support for GCC sanitizers in ``dfhack`` script
- `digfort`: added better map bounds checking
- `dfhack-run`: added support for port specified in ``remote-server.json``, to match DFHack's behavior
- `remove-stress`:

    - added support for ``-all`` as an alternative to the existing ``all`` argument for consistency
    - sped up significantly
    - improved output/error messages
    - now removes tantrums, depression, and obliviousness

- `ruby`: sped up handling of onupdate events

API
---
- New functions: ``Units::isDiplomat(unit)``
- Exposed ``Screen::zoom()`` to C++ (was Lua-only)

Internals
---------
- jsoncpp: updated to version 1.8.4 and switched to using a git submodule

Lua
---
- Added ``printall_recurse`` to print tables and DF references recursively. It can be also used with ``^`` from the `lua` interpreter.
- ``gui.widgets``: ``List:setChoices`` clones ``choices`` for internal table changes

Structures
----------
- ``history_event_entity_expels_hfst``: added (new in 0.44.11)
- ``history_event_site_surrenderedst``: added (new in 0.44.11)
- ``history_event_type``: added ``SITE_SURRENDERED``, ``ENTITY_EXPELS_HF`` (new in 0.44.11)
- ``syndrome``: identified a few fields
- ``viewscreen_civlistst``: fixed layout and identified many fields


DFHack 0.44.11-alpha1
=====================

Structures
----------
- Dropped 0.44.10 support
- Added support for automatically sizing arrays indexed with an enum
- Removed stale generated CSV files and DT layouts from pre-0.43.05
- ``announcement_type``: new in 0.44.11: ``NEW_HOLDING``, ``NEW_MARKET_LINK``
- ``breath_attack_type``: added ``OTHER``
- ``historical_figure_info.relationships.list``: added ``unk_3a``-``unk_3c`` fields at end
- ``interface_key``: added bindings new in 0.44.11
- ``occupation_type``: new in 0.44.11: ``MESSENGER``
- ``profession``: new in 0.44.11: ``MESSENGER``
- ``ui_sidebar_menus``:

    - ``unit.in_squad``: renamed to ``unit.squad_list_opened``, fixed location
    - ``unit``: added ``expel_error`` and other unknown fields new in 0.44.11
    - ``hospital``: added, new in 0.44.11
    - ``num_speech_tokens``, ``unk_17d8``: moved out of ``command_line`` to fix layout on x64

- ``viewscreen_civlistst``: added a few new fields (incomplete)
- ``viewscreen_locationsst``: identified ``edit_input``


DFHack 0.44.10-r2
=================

New Plugins
-----------
- `cxxrandom`: exposes some features of the C++11 random number library to Lua

New Scripts
-----------
- `gui/stamper`: allows manipulation of designations by transforms such as translations, reflections, rotations, and inversion
- `add-recipe`: adds unknown crafting recipes to the player's civ

Fixes
-----
- Fixed many tools incorrectly using the ``dead`` unit flag (they should generally check ``flags2.killed`` instead)
- Fixed many tools passing incorrect arguments to printf-style functions, including a few possible crashes (`changelayer`, `follow`, `forceequip`, `generated-creature-renamer`)
- Fixed ``-g`` flag (GDB) in Linux ``dfhack`` script (particularly on x64)
- Fixed several bugs in Lua scripts found by static analysis (df-luacheck)
- `autochop`, `autodump`, `autogems`, `automelt`, `autotrade`, `buildingplan`, `dwarfmonitor`, `fix-unit-occupancy`, `fortplan`, `stockflow`: fix issues with periodic tasks not working for some time after save/load cycles
- `autogems`, `fix-unit-occupancy`: stopped running when a fort isn't loaded (e.g. while embarking)
- `buildingplan`, `fortplan`: stopped running before a world has fully loaded
- `autogems`:

    - stop running repeatedly when paused
    - fixed crash when furnaces are linked to same stockpiles as jeweler's workshops

- `ban-cooking`: fixed errors introduced by kitchen structure changes in 0.44.10-r1
- `remove-stress`: fixed an error when running on soul-less units (e.g. with ``-all``)
- `revflood`: stopped revealing tiles adjacent to tiles above open space inappropriately
- `dig`: fixed "Inappropriate dig square" announcements if digging job has been posted
- `stockpiles`: ``loadstock`` now sets usable and unusable weapon and armor settings
- `stocks`: stopped listing carried items under stockpiles where they were picked up from
- `deramp`: fixed deramp to find designations that already have jobs posted
- `fixnaked`: fixed errors due to emotion changes in 0.44
- `autounsuspend`: now skips planned buildings

Misc Improvements
-----------------
- Added script name to messages produced by ``qerror()`` in Lua scripts
- Fixed an issue in around 30 scripts that could prevent edits to the files (adding valid arguments) from taking effect
- Linux: Added several new options to ``dfhack`` script: ``--remotegdb``, ``--gdbserver``, ``--strace``
- `bodyswap`: improved error handling
- `buildingplan`: added max quality setting
- `caravan`: documented (new in 0.44.10-alpha1)
- `deathcause`: added "slaughtered" to descriptions
- `fix/retrieve-units`: now re-adds units to active list to counteract `fix/dead-units`
- `item-descriptions`: fixed several grammatical errors
- `modtools/create-unit`:

    - added quantity argument
    - now selects a caste at random if none is specified

- `mousequery`:

    - migrated several features from TWBT's fork
    - added ability to drag with left/right buttons
    - added depth display for TWBT (when multilevel is enabled)
    - made shift+click jump to lower levels visible with TWBT

- `title-version`: added version to options screen too
- `embark-assistant`:

    - changed region interaction matching to search for evil rain, syndrome rain, and reanimation rather than interaction presence (misleadingly called evil weather), reanimation, and thralling
    - gave syndrome rain and reanimation wider ranges of criterion values

- `fix/dead-units`: added a delay of around 1 month before removing units

API
---
- New functions (also exposed to Lua):

    - ``Units::isKilled()``
    - ``Units::isActive()``
    - ``Units::isGhost()``

- Removed Vermin module (unused and obsolete)

Internals
---------
- Added fallback for YouCompleteMe database lookup failures (e.g. for newly-created files)
- jsoncpp: fixed constructor with ``long`` on Linux
- Improved efficiency and error handling in ``stl_vsprintf`` and related functions
- Added build option to generate symbols for large generated files containing df-structures metadata

Lua
---
- Added ``profiler`` module to measure lua performance
- Enabled shift+cursor movement in WorkshopOverlay-derived screens

Structures
----------
- ``unit_flags1``: renamed ``dead`` to ``inactive`` to better reflect its use
- ``item_body_component``: fixed location of ``corpse_flags``
- ``job_type``: added ``is_designation`` attribute
- ``unit_thought_type``: added ``SawDeadBody`` (new in 0.44.10)
- ``unit_personality``: fixed location of ``current_focus`` and ``undistracted_focus``
- ``incident_sub6_performance``: identified some fields
- ``job_handler``: fixed static array layout


DFHack 0.44.10-r1
=================

New Scripts
-----------
- `bodyswap`: shifts player control over to another unit in adventure mode

New Tweaks
----------
- `tweak` stone-status-all: adds an option to toggle the economic status of all stones
- `tweak` kitchen-prefs-all: adds an option to toggle cook/brew for all visible items in kitchen preferences

Fixes
-----
- Lua: registered ``dfhack.constructions.designateRemove()`` correctly
- `prospector`: fixed crash due to invalid vein materials
- `tweak` max-wheelbarrow: fixed conflict with building renaming
- `view-item-info`: stopped appending extra newlines permanently to descriptions

Misc Improvements
-----------------
- Added logo to documentation
- Documented several missing ``dfhack.gui`` Lua functions
- `adv-rumors`: bound to Ctrl-A
- `command-prompt`: added support for ``Gui::getSelectedPlant()``
- `gui/advfort`: bound to Ctrl-T
- `gui/room-list`: added support for ``Gui::getSelectedBuilding()``
- `gui/unit-info-viewer`: bound to Alt-I
- `modtools/create-unit`: made functions available to other scripts
- `search-plugin`:

    - added support for stone restrictions screen (under ``z``: Status)
    - added support for kitchen preferences (also under ``z``)


API
---
- New functions (all available to Lua as well):

    - ``Buildings::getRoomDescription()``
    - ``Items::checkMandates()``
    - ``Items::canTrade()``
    - ``Items::canTradeWithContents()``
    - ``Items::isRouteVehicle()``
    - ``Items::isSquadEquipment()``
    - ``Kitchen::addExclusion()``
    - ``Kitchen::findExclusion()``
    - ``Kitchen::removeExclusion()``

- syndrome-util: added ``eraseSyndromeData()``

Internals
---------
- Fixed compiler warnings on all supported build configurations
- Windows build scripts now work with non-C system drives

Structures
----------
- ``dfhack_room_quality_level``: new enum
- ``glowing_barrier``: identified ``triggered``, added comments
- ``item_flags2``: renamed ``has_written_content`` to ``unk_book``
- ``kitchen_exc_type``: new enum (for ``ui.kitchen``)
- ``mandate.mode``: now an enum
- ``unit_personality.emotions.flags.memory``: identified
- ``viewscreen_kitchenprefst.forbidden``, ``possible``: now a bitfield, ``kitchen_pref_flag``
- ``world_data.feature_map``: added extensive documentation (in XML)


DFHack 0.44.10-beta1
====================

New Scripts
-----------
- `devel/find-primitive`: finds a primitive variable in memory

Fixes
-----
- Units::getAnyUnit(): fixed a couple problematic conditions and potential segfaults if global addresses are missing
- `stockpiles`: stopped sidebar option from overlapping with `autodump`
- `autodump`, `automelt`, `autotrade`, `stocks`, `stockpiles`: fixed conflict with building renaming
- `tweak` block-labors: fixed two causes of crashes related in the v-p-l menu
- `full-heal`:

    - units no longer have a tendency to melt after being healed
    - healed units are no longer treated as patients by hospital staff
    - healed units no longer attempt to clean themselves unsuccessfully
    - wounded fliers now regain the ability to fly upon being healing
    - now heals suffocation, numbness, infection, spilled guts and gelding

- `modtools/create-unit`:

    - creatures of the appropriate age are now spawned as babies or children where applicable
    - fix: civ_id is now properly assigned to historical_figure, resolving several hostility issues (spawned pets are no longer attacked by fortress military!)
    - fix: unnamed creatures are no longer spawned with a string of numbers as a first name

- `exterminate`: fixed documentation of ``this`` option

Misc Improvements
-----------------
- `blueprint`: added a basic Lua API
- `devel/export-dt-ini`: added tool offsets for DT 40
- `devel/save-version`: added current DF version to output
- `install-info`: added information on tweaks

Internals
---------
- Added ``Gui::inRenameBuilding()``
- Added function names to DFHack's NullPointer and InvalidArgument exceptions
- Linux: required plugins to have symbols resolved at link time, for consistency with other platforms


DFHack 0.44.10-alpha1
=====================

New Scripts
-----------
- `caravan`: adjusts properties of caravans
- `gui/autogems`: a configuration UI for the `autogems` plugin

Fixes
-----
- Fixed uninitialized pointer being returned from ``Gui::getAnyUnit()`` in rare cases
- `autohauler`, `autolabor`, `labormanager`: fixed fencepost error and potential crash
- `dwarfvet`: fixed infinite loop if an animal is not accepted at a hospital
- `liquids`: fixed "range" command to default to 1 for dimensions consistently
- `search-plugin`: fixed 4/6 keys in unit screen search
- `view-item-info`: fixed an error with some armor

Misc Improvements
-----------------
- `autogems`: can now blacklist arbitrary gem types (see `gui/autogems`)
- `exterminate`: added more words for current unit, removed warning
- `fpause`: now pauses worldgen as well

Internals
---------
- Added some build scripts for Sublime Text
- Changed submodule URLs to relative URLs so that they can be cloned consistently over different protocols (e.g. SSH)


DFHack 0.44.09-r1
=================

Fixes
-----
- `modtools/item-trigger`: fixed token format in help text

Misc Improvements
-----------------
- Reorganized changelogs and improved changelog editing process
- `modtools/item-trigger`: added support for multiple type/material/contaminant conditions

Internals
---------
- OS X: Can now build with GCC 7 (or older)

Structures
----------
- ``renderer``: fixed vtable addresses on 64-bit OS X
- ``building_type``: added human-readable ``name`` attribute
- ``furnace_type``: added human-readable ``name`` attribute
- ``workshop_type``: added human-readable ``name`` attribute
- ``army``: added vector new in 0.44.07
- ``site_reputation_report``: named ``reports`` vector


DFHack 0.44.09-alpha1
=====================

Fixes
-----
- `digtype`: stopped designating non-vein tiles (open space, trees, etc.)
- `labormanager`: fixed crash due to dig jobs targeting some unrevealed map blocks


DFHack 0.44.08-alpha1
=====================

Fixes
-----
- `fix/dead-units`: fixed a bug that could remove some arriving (not dead) units


DFHack 0.44.07-beta1
====================

Misc Improvements
-----------------
- `modtools/item-trigger`: added the ability to specify inventory mode(s) to trigger on

Structures
----------
- Added symbols for Toady's `0.44.07 Linux test build <http://www.bay12forums.com/smf/index.php?topic=169839.msg7720111#msg7720111>`_ to fix :bug:`10615`
- ``world_site``: fixed alignment


DFHack 0.44.07-alpha1
=====================

Fixes
-----
- Support for building on Ubuntu 18.04
- Fixed some CMake warnings (CMP0022)
- `embark-assistant`: fixed detection of reanimating biomes

Misc Improvements
-----------------
- `embark-assistant`:

    - Added search for adamantine
    - Now supports saving/loading profiles

- `fillneeds`: added ``-all`` option to apply to all units
- `remotefortressreader`: added flows, instruments, tool names, campfires, ocean waves, spiderwebs

Structures
----------
- Several new names in instrument raw structures
- ``identity``: identified ``profession``, ``civ``
- ``manager_order_template``: fixed last field type
- ``viewscreen_createquotast``: fixed layout
- ``world.language``: moved ``colors``, ``shapes``, ``patterns`` to ``world.descriptors``
- ``world.reactions``, ``world.reaction_categories``: moved to new compound, ``world.reactions``. Requires renaming:

    - ``world.reactions`` to ``world.reactions.reactions``
    - ``world.reaction_categories`` to ``world.reactions.reaction_categories``



DFHack 0.44.05-r2
=================

New Plugins
-----------
- `embark-assistant`: adds more information and features to embark screen

New Scripts
-----------
- `adv-fix-sleepers`: fixes units in adventure mode who refuse to wake up (:bug:`6798`)
- `hermit`: blocks caravans, migrants, diplomats (for hermit challenge)

New Features
------------
- With ``PRINT_MODE:TEXT``, setting the ``DFHACK_HEADLESS`` environment variable will hide DF's display and allow the console to be used normally. (Note that this is intended for testing and is not very useful for actual gameplay.)

Fixes
-----
- `devel/export-dt-ini`: fix language_name offsets for DT 39.2+
- `devel/inject-raws`: fixed gloves and shoes (old typo causing errors)
- `remotefortressreader`: fixed an issue with not all engravings being included
- `view-item-info`: fixed an error with some shields

Misc Improvements
-----------------
- `adv-rumors`: added more keywords, including names
- `autochop`: can now exclude trees that produce fruit, food, or cookable items
- `remotefortressreader`: added plant type support


DFHack 0.44.05-r1
=================

New Scripts
-----------
- `break-dance`: Breaks up a stuck dance activity
- `fillneeds`: Use with a unit selected to make them focused and unstressed
- `firestarter`: Lights things on fire: items, locations, entire inventories even!
- `flashstep`: Teleports adventurer to cursor
- `ghostly`: Turns an adventurer into a ghost or back
- `questport`: Sends your adventurer to the location of your quest log cursor
- `view-unit-reports`: opens the reports screen with combat reports for the selected unit

Fixes
-----
- `devel/inject-raws`: now recognizes spaces in reaction names
- `dig`: added support for designation priorities - fixes issues with designations from ``digv`` and related commands having extremely high priority
- `dwarfmonitor`:

    - fixed display of creatures and poetic/music/dance forms on ``prefs`` screen
    - added "view unit" option
    - now exposes the selected unit to other tools

- `names`: fixed many errors
- `quicksave`: fixed an issue where the "Saving..." indicator often wouldn't appear

Misc Improvements
-----------------
- `gui/gm-unit`:

    - added a profession editor
    - misc. layout improvements

- `remotefortressreader`:

    - support for moving adventurers
    - support for vehicles, gem shapes, item volume, art images, item improvements

- `binpatch`: now reports errors for empty patch files
- `force`: now provides useful help
- `full-heal`:

    - can now select corpses to resurrect
    - now resets body part temperatures upon resurrection to prevent creatures from freezing/melting again
    - now resets units' vanish countdown to reverse effects of `exterminate`

- `launch`: can now ride creatures
- `names`: can now edit names of units

Removed
-------
- `tweak`: ``kitchen-keys``: :bug:`614` fixed in DF 0.44.04

Internals
---------
- ``Gui::getAnyUnit()`` supports many more screens/menus

Structures
----------
- New globals: ``soul_next_id``


DFHack 0.44.05-alpha1
=====================

Misc Improvements
-----------------
- `gui/liquids`: added more keybindings: 0-7 to change liquid level, P/B to cycle backwards

Structures
----------
- ``incident``: re-aligned again to match disassembly


DFHack 0.44.04-alpha1
=====================

Fixes
-----
- `devel/inject-raws`: now recognizes spaces in reaction names
- `exportlegends`: fixed an error that could occur when exporting empty lists

Structures
----------
- ``artifact_record``: fixed layout (changed in 0.44.04)
- ``incident``: fixed layout (changed in 0.44.01) - note that many fields have moved


DFHack 0.44.03-beta1
====================

Fixes
-----
- `autolabor`, `autohauler`, `labormanager`: added support for "put item on display" jobs and building/destroying display furniture
- `gui/gm-editor`: fixed an error when editing primitives in Lua tables

Misc Improvements
-----------------
- `devel/dump-offsets`: now ignores ``index`` globals
- `gui/pathable`: added tile types to sidebar
- `modtools/skill-change`:

    - now updates skill levels appropriately
    - only prints output if ``-loud`` is passed


Structures
----------
- New globals:

    - ``version``
    - ``min_load_version``
    - ``movie_version``
    - ``basic_seed``
    - ``title``
    - ``title_spaced``
    - ``ui_building_resize_radius``

- Added ``twbt_render_map`` code offset on x64
- Fixed an issue preventing ``enabler`` from being allocated by DFHack
- Added ``job_type.PutItemOnDisplay``
- Found ``renderer`` vtable on osx64
- ``adventure_movement_optionst``, ``adventure_movement_hold_tilest``, ``adventure_movement_climbst``: named coordinate fields
- ``mission``: added type
- ``unit``: added 3 new vmethods: ``getCreatureTile``, ``getCorpseTile``, ``getGlowTile``
- ``viewscreen_assign_display_itemst``: fixed layout on x64 and identified many fields
- ``viewscreen_reportlistst``: fixed layout, added ``mission_id`` vector
- ``world.status``: named ``missions`` vector


DFHack 0.44.03-alpha1
=====================

Lua
---
- Improved ``json`` I/O error messages
- Stopped a crash when trying to create instances of classes whose vtable addresses are not available


DFHack 0.44.02-beta1
====================

New Scripts
-----------
- `devel/check-other-ids`: Checks the validity of "other" vectors in the ``world`` global
- `gui/cp437-table`: An in-game CP437 table

Fixes
-----
- Fixed issues with the console output color affecting the prompt on Windows
- `createitem`: stopped items from teleporting away in some forts
- `gui/gm-unit`: can now edit mining skill
- `gui/quickcmd`: stopped error from adding too many commands
- `modtools/create-unit`: fixed error when domesticating units

Misc Improvements
-----------------
- The console now provides suggestions for built-in commands
- `devel/export-dt-ini`: avoid hardcoding flags
- `exportlegends`:

    - reordered some tags to match DF's order
    - added progress indicators for exporting long lists

- `gui/gm-editor`: added enum names to enum edit dialogs
- `gui/gm-unit`: made skill search case-insensitive
- `gui/rename`: added "clear" and "special characters" options
- `remotefortressreader`:

    - includes item stack sizes
    - some performance improvements


Removed
-------
- `warn-stuck-trees`: :bug:`9252` fixed in DF 0.44.01

Lua
---
- Exposed ``get_vector()`` (from C++) for all types that support ``find()``, e.g. ``df.unit.get_vector() == df.global.world.units.all``

Structures
----------
- Located ``start_dwarf_count`` offset for all builds except 64-bit Linux; `startdwarf` should work now
- Added ``buildings_other_id.DISPLAY_CASE``
- Fixed ``viewscreen_titlest.start_savegames`` alignment
- Fixed ``unit`` alignment
- Identified ``historical_entity.unknown1b.deities`` (deity IDs)


DFHack 0.44.02-alpha1
=====================

New Scripts
-----------
- `devel/dump-offsets`: prints an XML version of the global table included in in DF

Fixes
-----
- Fixed a crash that could occur if a symbol table in symbols.xml had no content

Lua
---
- Added a new ``dfhack.console`` API
- API can now wrap functions with 12 or 13 parameters

Structures
----------
- The ``ui_menu_width`` global is now a 2-byte array; the second item is the former ``ui_area_map_width`` global, which is now removed
- The former ``announcements`` global is now a field in ``d_init``
- ``world`` fields formerly beginning with ``job_`` are now fields of ``world.jobs``, e.g. ``world.job_list`` is now ``world.jobs.list``


