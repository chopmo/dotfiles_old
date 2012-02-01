
url_completion_use_history = true;

// Disable automatic spell checker
session_pref("layout.spellcheckDefault", 0);

add_hook("before_quit_hook",
         function () {
             var w = get_recent_conkeror_window();
             var result = (w == null) ||
                 "y" == (yield w.minibuffer.read_single_character_option(
                     $prompt = "Quit Conkeror? (y/n)",
                     $options = ["y", "n"]));
             yield co_return(result);
         });


url_completion_use_history = true;
define_key(content_buffer_normal_keymap, "d", "follow-new-buffer");

// register_user_stylesheet(
//     "data:text/css," +
//         escape(
//             "@namespace url(\"http://www.w3.org/1999/xhtml\");\n" +
//             "span.__conkeror_hint {\n"+
//             "  font-size: 18px !important;\n"+
//             "  line-height: 18px !important;\n"+
//             "}"));

require("page-modes/google-search-results.js");
google_search_bind_number_shortcuts();

// the default page for new buffers.
homepage = "about:blank";

// load urls from the command line in new buffers instead
// of new windows.
url_remoting_fn = load_url_in_new_buffer;

// load download buffers in the background in the current
// window, instead of in new windows.
download_buffer_automatic_open_target = OPEN_NEW_BUFFER_BACKGROUND;

// save a keystroke when selecting a dom node by number.
// hints_auto_exit_delay = 500;
// hints_ambiguous_auto_exit_delay = 500;

// display properties of the current selected node during
// the hints interaction.
hints_display_url_panel = true;

// default directory for downloads and shell commands.
cwd = get_home_directory();
cwd.append("Downloads");

// automatically handle some mime types internally.
content_handlers.set("application/pdf", content_handler_save);

// external programs for handling various mime types.
external_content_handlers.set("application/pdf", "open -a Preview.app");
// external_content_handlers.set("video/*", "urxvtc -e mplayer");

