/* tracker-miner.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Tracker", gir_namespace = "TrackerMiner", gir_version = "1.0", lower_case_cprefix = "tracker_")]
namespace Tracker {
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_decorator_get_type ()")]
	public abstract class Decorator : Tracker.Miner, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected Decorator ();
		public void delete_id (int id);
		public static GLib.Quark error_quark ();
		[CCode (array_length = false, array_null_terminated = true)]
		public unowned string[] get_class_names ();
		public unowned string get_data_source ();
		public uint get_n_items ();
		public async Tracker.DecoratorInfo next (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public void prepend_id (int id, int class_name_id);
		public void set_priority_rdf_types (string rdf_types);
		[CCode (array_length = false, array_null_terminated = true)]
		[NoAccessorMethod]
		public string[] class_names { owned get; set; }
		[NoAccessorMethod]
		public int commit_batch_size { get; set; }
		public string data_source { get; construct; }
		[CCode (array_length = false, array_null_terminated = true)]
		public string[] priority_rdf_types { set; }
		public virtual signal void finished ();
		public virtual signal void items_available ();
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_decorator_fs_get_type ()")]
	public abstract class DecoratorFS : Tracker.Decorator, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected DecoratorFS ();
		public int prepend_file (GLib.File file);
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", ref_function = "tracker_decorator_info_ref", type_id = "tracker_decorator_info_get_type ()", unref_function = "tracker_decorator_info_unref")]
	[Compact]
	public class DecoratorInfo {
		public unowned string get_mimetype ();
		public Tracker.Sparql.Builder get_sparql ();
		public unowned GLib.Task get_task ();
		public unowned string get_url ();
		public unowned string get_urn ();
		public Tracker.DecoratorInfo @ref ();
		public void unref ();
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_indexing_tree_get_type ()")]
	public class IndexingTree : GLib.Object {
		[CCode (has_construct_function = false)]
		public IndexingTree ();
		public void add (GLib.File directory, Tracker.DirectoryFlags flags);
		public void add_filter (Tracker.FilterType filter, string glob_string);
		public void clear_filters (Tracker.FilterType type);
		public bool file_is_indexable (GLib.File file, GLib.FileType file_type);
		public bool file_is_root (GLib.File file);
		public bool file_matches_filter (Tracker.FilterType type, GLib.File file);
		public Tracker.FilterPolicy get_default_policy (Tracker.FilterType filter);
		public bool get_filter_hidden ();
		public unowned GLib.File get_master_root ();
		public unowned GLib.File get_root (GLib.File file, out Tracker.DirectoryFlags directory_flags);
		public GLib.List<weak GLib.File> list_roots ();
		public bool parent_is_indexable (GLib.File parent, GLib.List<GLib.File> children);
		public void remove (GLib.File directory);
		public void set_default_policy (Tracker.FilterType filter, Tracker.FilterPolicy policy);
		public void set_filter_hidden (bool filter_hidden);
		[CCode (has_construct_function = false)]
		public IndexingTree.with_root (GLib.File root);
		public bool filter_hidden { get; set; }
		[NoAccessorMethod]
		public GLib.File root { owned get; construct; }
		public virtual signal void directory_added (GLib.File directory);
		public virtual signal void directory_removed (GLib.File directory);
		public virtual signal void directory_updated (GLib.File directory);
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_miner_get_type ()")]
	public abstract class Miner : GLib.Object, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected Miner ();
		public static GLib.Quark error_quark ();
		public Tracker.Sparql.Connection get_connection ();
		public unowned GLib.DBusConnection get_dbus_connection ();
		public unowned string get_dbus_full_name ();
		public unowned string get_dbus_full_path ();
		public uint get_n_pause_reasons ();
		public bool is_paused ();
		public bool is_started ();
		public int pause (string reason) throws GLib.Error;
		public bool resume (int cookie) throws GLib.Error;
		public void start ();
		public void stop ();
		[NoAccessorMethod]
		public void* introspection_handler { get; set construct; }
		[NoAccessorMethod]
		public string introspection_xml { owned get; set construct; }
		[NoAccessorMethod]
		public string name { owned get; construct; }
		[NoAccessorMethod]
		public virtual double progress { get; set construct; }
		[NoAccessorMethod]
		public int remaining_time { get; set construct; }
		[NoAccessorMethod]
		public string status { owned get; set construct; }
		[HasEmitter]
		public virtual signal void paused ();
		public virtual signal void resumed ();
		public virtual signal void started ();
		public virtual signal void stopped ();
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_miner_fs_get_type ()")]
	public abstract class MinerFS : Tracker.Miner, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected MinerFS ();
		public void add_directory_without_parent (GLib.File file);
		public void check_directory (GLib.File file, bool check_parents);
		public void check_directory_with_priority (GLib.File file, int priority, bool check_parents);
		public void check_file (GLib.File file, bool check_parents);
		public void check_file_with_priority (GLib.File file, int priority, bool check_parents);
		public void directory_add (GLib.File file, bool recurse);
		public bool directory_remove (GLib.File file);
		public bool directory_remove_full (GLib.File file);
		public static GLib.Quark error_quark ();
		public void file_notify (GLib.File file, GLib.Error error);
		public void force_mtime_checking (GLib.File directory);
		public void force_recheck ();
		public unowned Tracker.DataProvider get_data_provider ();
		public unowned Tracker.IndexingTree get_indexing_tree ();
		public bool get_initial_crawling ();
		public bool get_mtime_checking ();
		public unowned string? get_parent_urn (GLib.File file);
		public double get_throttle ();
		public unowned string? get_urn (GLib.File file);
		public bool has_items_to_process ();
		public string query_urn (GLib.File file);
		public void set_initial_crawling (bool do_initial_crawling);
		public void set_mtime_checking (bool mtime_checking);
		public void set_throttle (double throttle);
		public void writeback_notify (GLib.File file, GLib.Error error);
		public Tracker.DataProvider data_provider { get; construct; }
		public bool initial_crawling { get; set; }
		public bool mtime_checking { get; set construct; }
		[NoAccessorMethod]
		public uint processing_pool_ready_limit { get; set construct; }
		[NoAccessorMethod]
		public uint processing_pool_wait_limit { get; set construct; }
		[NoAccessorMethod]
		public GLib.File root { owned get; construct; }
		public double throttle { get; set; }
		public virtual signal void finished (double elapsed, uint directories_found, uint directories_ignored, uint files_found, uint files_ignored);
		public virtual signal void finished_root (GLib.File root);
		[Deprecated (since = "0.12")]
		public virtual signal bool process_file (GLib.File file, Tracker.Sparql.Builder builder, GLib.Cancellable? cancellable = null);
		public virtual signal bool process_file_attributes (GLib.File file, Tracker.Sparql.Builder builder, GLib.Cancellable? cancellable = null);
		public signal bool writeback_file (GLib.File file, [CCode (array_length = false, array_null_terminated = true)] string[] rdf_types, GLib.GenericArray<string[]> results, GLib.Cancellable? cancellable = null);
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_miner_online_get_type ()")]
	public abstract class MinerOnline : Tracker.Miner, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected MinerOnline ();
		public Tracker.NetworkType get_network_type ();
		public Tracker.NetworkType network_type { get; }
		public virtual signal bool connected (Tracker.NetworkType network);
		public virtual signal void disconnected ();
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_data_provider_get_type ()")]
	public interface DataProvider : GLib.Object {
		public abstract Tracker.Enumerator begin (GLib.File url, string attributes, Tracker.DirectoryFlags flags, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public abstract async Tracker.Enumerator begin_async (GLib.File url, string attributes, Tracker.DirectoryFlags flags, int io_priority, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public abstract bool end (Tracker.Enumerator enumerator, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public abstract async bool end_async (Tracker.Enumerator enumerator, int io_priority, GLib.Cancellable? cancellable = null) throws GLib.Error;
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", type_id = "tracker_enumerator_get_type ()")]
	public interface Enumerator : GLib.Object {
		public abstract void* next (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public abstract async void* next_async (int io_priority, GLib.Cancellable? cancellable = null) throws GLib.Error;
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cprefix = "TRACKER_DIRECTORY_FLAG_", type_id = "tracker_directory_flags_get_type ()")]
	[Flags]
	public enum DirectoryFlags {
		NONE,
		RECURSE,
		CHECK_MTIME,
		MONITOR,
		IGNORE,
		PRESERVE,
		PRIORITY,
		NO_STAT
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cprefix = "TRACKER_FILTER_POLICY_", type_id = "tracker_filter_policy_get_type ()")]
	public enum FilterPolicy {
		DENY,
		ACCEPT
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cprefix = "TRACKER_FILTER_", type_id = "tracker_filter_type_get_type ()")]
	public enum FilterType {
		FILE,
		DIRECTORY,
		PARENT_DIRECTORY
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cprefix = "TRACKER_NETWORK_TYPE_", type_id = "tracker_network_type_get_type ()")]
	public enum NetworkType {
		NONE,
		UNKNOWN,
		GPRS,
		EDGE,
		@3G,
		LAN
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cprefix = "TRACKER_DECORATOR_ERROR_")]
	public errordomain DecoratorError {
		EMPTY,
		PAUSED
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cprefix = "TRACKER_MINER_ERROR_")]
	public errordomain MinerError {
		NAME_MISSING,
		NAME_UNAVAILABLE,
		PAUSED,
		PAUSED_ALREADY,
		INVALID_COOKIE
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cprefix = "TRACKER_MINER_FS_ERROR_")]
	public errordomain MinerFSError {
		[CCode (cname = "TRACKER_MINER_FS_ERROR_INIT")]
		MINER_FS_ERROR_INIT
	}
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cname = "TRACKER_MINER_DBUS_INTERFACE")]
	public const string MINER_DBUS_INTERFACE;
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cname = "TRACKER_MINER_DBUS_NAME_PREFIX")]
	public const string MINER_DBUS_NAME_PREFIX;
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cname = "TRACKER_MINER_DBUS_PATH_PREFIX")]
	public const string MINER_DBUS_PATH_PREFIX;
	[CCode (cheader_filename = "libtracker-miner/tracker-miner.h", cname = "TRACKER_MINER_ERROR_DOMAIN")]
	public const string MINER_ERROR_DOMAIN;
}
