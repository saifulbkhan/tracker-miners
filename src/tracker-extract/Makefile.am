#
# _RULES_DIR = $(datadir)/tracker/extract-rules
#
rulesdir = $(TRACKER_EXTRACT_RULES_DIR)

module_flags = $(DTAGS_LDFLAGS) -module -avoid-version -no-undefined

AM_CPPFLAGS = \
	$(BUILD_CFLAGS) \
	-I$(top_srcdir)/src \
	-I$(top_builddir)/src \
	-I$(top_srcdir)/src/libtracker-miners-common/ \
	-I$(top_builddir)/src/libtracker-miners-common/ \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DTRACKER_EXTRACTORS_DIR=\""$(TRACKER_EXTRACT_MODULES_DIR)"\" \
	$(TRACKER_EXTRACT_CFLAGS)

# NOTE: The rules are here and not in another sub-directory because we
# only install rules for extractors we build. If we decouple this, it
# duplicates work and requires more maintenance to keep modules up to
# date. If you are adding a new rule then add it to both rules_files
# and then separately with the module below.
rules_files = \
	10-abw.rule \
	10-dvi.rule \
	10-epub.rule \
	10-flac.rule \
	10-gif.rule \
	10-html.rule \
	10-ico.rule \
	10-jpeg.rule \
	10-mp3.rule \
	10-msoffice.rule \
	10-oasis.rule \
	10-pdf.rule \
	10-png.rule \
	10-ps.rule \
	10-svg.rule \
	10-tiff.rule \
	10-vorbis.rule \
	10-xmp.rule \
	10-xps.rule \
	10-bmp.rule \
	10-ebooks.rule \
	10-comics.rule \
	11-iso.rule \
	11-msoffice-xml.rule \
	15-gstreamer-guess.rule \
	15-playlist.rule \
	15-source-code.rule \
	90-gstreamer-image-generic.rule \
	90-gstreamer-audio-generic.rule \
	90-gstreamer-video-generic.rule \
	90-text-generic.rule \
	90-libav-audio-generic.rule \
	90-libav-video-generic.rule \
	91-gstreamer-generic-dlna.rule

# NOTE:
# We don't always link with libtracker-miners-common, we only link
# against it if we directly use functions in the .so
#
# _MODULES_DIR = $(libdir)/tracker-$(TRACKER_API_VERSION)/extract-modules
#
extractmodulesdir = $(TRACKER_EXTRACT_MODULES_DIR)
extractmodules_LTLIBRARIES = # Empty
rules_DATA = # Empty

if HAVE_LIBVORBIS
extractmodules_LTLIBRARIES += libextract-vorbis.la
rules_DATA += 10-vorbis.rule
endif

if HAVE_LIBFLAC
extractmodules_LTLIBRARIES += libextract-flac.la
rules_DATA += 10-flac.rule
endif

if HAVE_EXEMPI
extractmodules_LTLIBRARIES += libextract-xmp.la
rules_DATA += 10-xmp.rule
endif

if HAVE_LIBGIF
extractmodules_LTLIBRARIES += libextract-gif.la
rules_DATA += 10-gif.rule
endif

if HAVE_LIBJPEG
extractmodules_LTLIBRARIES += libextract-jpeg.la
rules_DATA += 10-jpeg.rule
endif

if HAVE_LIBTIFF
extractmodules_LTLIBRARIES += libextract-tiff.la
rules_DATA += 10-tiff.rule
endif

if HAVE_LIBXML2
extractmodules_LTLIBRARIES += libextract-html.la
rules_DATA += 10-html.rule
endif

if HAVE_LIBGSF
extractmodules_LTLIBRARIES += \
	libextract-epub.la \
	libextract-msoffice.la \
	libextract-msoffice-xml.la \
	libextract-oasis.la
rules_DATA += 10-epub.rule 10-oasis.rule 10-msoffice.rule 11-msoffice-xml.rule
endif

if HAVE_LIBGXPS
extractmodules_LTLIBRARIES += libextract-xps.la
rules_DATA += 10-xps.rule
endif

if HAVE_POPPLER
extractmodules_LTLIBRARIES += libextract-pdf.la
rules_DATA += 10-pdf.rule
endif

if HAVE_GSTREAMER
extractmodules_LTLIBRARIES += libextract-gstreamer.la
rules_DATA += 10-svg.rule 15-gstreamer-guess.rule 90-gstreamer-image-generic.rule 90-gstreamer-audio-generic.rule 90-gstreamer-video-generic.rule
endif

# Gstreamer with GUPnP-DLNA backend?
if HAVE_GUPNP_DLNA
rules_DATA += 91-gstreamer-generic-dlna.rule
endif

if HAVE_TOTEM_PL_PARSER
extractmodules_LTLIBRARIES += libextract-playlist.la
rules_DATA += 15-playlist.rule
endif

if HAVE_LIBOSINFO
extractmodules_LTLIBRARIES += libextract-iso.la
rules_DATA += 11-iso.rule
endif

if HAVE_LIBPNG
extractmodules_LTLIBRARIES += libextract-png.la
rules_DATA += 10-png.rule
endif

if HAVE_ABIWORD
extractmodules_LTLIBRARIES += libextract-abw.la
rules_DATA += 10-abw.rule
endif

if HAVE_DVI
extractmodules_LTLIBRARIES += libextract-dvi.la
rules_DATA += 10-dvi.rule
endif

if HAVE_MP3
extractmodules_LTLIBRARIES += libextract-mp3.la
rules_DATA += 10-mp3.rule
endif

if HAVE_PS
extractmodules_LTLIBRARIES += libextract-ps.la
rules_DATA += 10-ps.rule
endif

if HAVE_TEXT
extractmodules_LTLIBRARIES += libextract-text.la
rules_DATA += 15-source-code.rule 90-text-generic.rule
endif

if HAVE_ICON
extractmodules_LTLIBRARIES += libextract-icon.la
rules_DATA += 10-ico.rule
endif

if HAVE_LIBAV
extractmodules_LTLIBRARIES += libextract-libav.la
rules_DATA += 90-libav-audio-generic.rule 90-libav-video-generic.rule
endif

extractmodules_LTLIBRARIES += libextract-bmp.la
rules_DATA += 10-bmp.rule

extractmodules_LTLIBRARIES += libextract-dummy.la
# Rule files using the dummy extractor
rules_DATA += 10-comics.rule
rules_DATA += 10-ebooks.rule

# ABW
libextract_abw_la_SOURCES = tracker-extract-abw.c
libextract_abw_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_abw_la_LDFLAGS = $(module_flags)
libextract_abw_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# MP3
libextract_mp3_la_SOURCES = tracker-extract-mp3.c
libextract_mp3_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_mp3_la_LDFLAGS = $(module_flags)
libextract_mp3_la_LIBADD =  \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# Vorbis (OGG)
libextract_vorbis_la_SOURCES = tracker-extract-vorbis.c
libextract_vorbis_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_vorbis_la_LDFLAGS = $(module_flags)
libextract_vorbis_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBVORBIS_LIBS)

# Flac
libextract_flac_la_SOURCES = tracker-extract-flac.c
libextract_flac_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_flac_la_LDFLAGS = $(module_flags)
libextract_flac_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBFLAC_LIBS)

# Oasis
libextract_oasis_la_SOURCES = tracker-extract-oasis.c
libextract_oasis_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBGSF_CFLAGS)
libextract_oasis_la_LDFLAGS = $(module_flags)
libextract_oasis_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBGSF_LIBS)

# EPub
libextract_epub_la_SOURCES = tracker-extract-epub.c
libextract_epub_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBGSF_CFLAGS)
libextract_epub_la_LDFLAGS = $(module_flags)
libextract_epub_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBGSF_LIBS)

# PNG
libextract_png_la_SOURCES = tracker-extract-png.c
libextract_png_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBPNG_CFLAGS)
libextract_png_la_LDFLAGS = $(module_flags)
libextract_png_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBPNG_LIBS)


# PS
libextract_ps_la_SOURCES = tracker-extract-ps.c
libextract_ps_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_ps_la_LDFLAGS = $(module_flags)
libextract_ps_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# XMP
libextract_xmp_la_SOURCES = tracker-extract-xmp.c
libextract_xmp_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_xmp_la_LDFLAGS = $(module_flags)
libextract_xmp_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# HTML
libextract_html_la_SOURCES = tracker-extract-html.c
libextract_html_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBXML2_CFLAGS)
libextract_html_la_LDFLAGS = $(module_flags)
libextract_html_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBXML2_LIBS)

# MS Office
libextract_msoffice_la_SOURCES = tracker-extract-msoffice.c
libextract_msoffice_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBGSF_CFLAGS)
libextract_msoffice_la_LDFLAGS = $(module_flags)
libextract_msoffice_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBGSF_LIBS)

# MS Office XML
libextract_msoffice_xml_la_SOURCES = tracker-extract-msoffice-xml.c
libextract_msoffice_xml_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBGSF_CFLAGS)
libextract_msoffice_xml_la_LDFLAGS = $(module_flags)
libextract_msoffice_xml_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# XPS
libextract_xps_la_SOURCES = tracker-extract-xps.c
libextract_xps_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBGXPS_CFLAGS)
libextract_xps_la_LDFLAGS = $(module_flags)
libextract_xps_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBGXPS_LIBS)

# PDF
libextract_pdf_la_SOURCES = tracker-extract-pdf.c
libextract_pdf_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(POPPLER_CFLAGS)
libextract_pdf_la_LDFLAGS = $(module_flags)
libextract_pdf_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(POPPLER_LIBS)

# DVI
libextract_dvi_la_SOURCES = tracker-extract-dvi.c
libextract_dvi_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_dvi_la_LDFLAGS = $(module_flags)
libextract_dvi_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# GStreamer
libextract_gstreamer_la_SOURCES = \
	tracker-extract-gstreamer.c \
	tracker-cue-sheet.h \
	tracker-cue-sheet.c
libextract_gstreamer_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(GSTREAMER_CFLAGS) \
	$(LIBCUE_CFLAGS)
libextract_gstreamer_la_LDFLAGS = $(module_flags)
libextract_gstreamer_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(GSTREAMER_LIBS) \
	$(LIBCUE_LIBS)

# GStreamer with GUPnP-DLNA backend?
if HAVE_GUPNP_DLNA
libextract_gstreamer_la_CFLAGS += $(GUPNP_DLNA_CFLAGS)
libextract_gstreamer_la_LIBADD += $(GUPNP_DLNA_LIBS)
endif

# GStreamer with Discoverer backend?
if HAVE_GSTREAMER_PBUTILS
libextract_gstreamer_la_CFLAGS += $(GSTREAMER_PBUTILS_CFLAGS)
libextract_gstreamer_la_LIBADD += $(GSTREAMER_PBUTILS_LIBS)
endif

# GIF
libextract_gif_la_SOURCES = tracker-extract-gif.c
libextract_gif_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBGIF_CFLAGS)
libextract_gif_la_LDFLAGS = $(module_flags)
libextract_gif_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBGIF_LIBS)

# JPEG
libextract_jpeg_la_SOURCES = tracker-extract-jpeg.c
libextract_jpeg_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBJPEG_CFLAGS)
libextract_jpeg_la_LDFLAGS = $(module_flags)
libextract_jpeg_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBJPEG_LIBS)

# TIFF
libextract_tiff_la_SOURCES = tracker-extract-tiff.c $(xmp_sources) $(iptc_sources)
libextract_tiff_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBTIFF_CFLAGS)
libextract_tiff_la_LDFLAGS = $(module_flags)
libextract_tiff_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBTIFF_LIBS)

# Playlists using totem-pl-parser
libextract_playlist_la_SOURCES = tracker-extract-playlist.c
libextract_playlist_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(TOTEM_PL_PARSER_CFLAGS)
libextract_playlist_la_LDFLAGS = $(module_flags)
libextract_playlist_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(TOTEM_PL_PARSER_LIBS)

# TEXT
libextract_text_la_SOURCES = tracker-extract-text.c
libextract_text_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_text_la_LDFLAGS = $(module_flags)
libextract_text_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# ICON
libextract_icon_la_SOURCES = tracker-extract-icon.c
libextract_icon_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_icon_la_LDFLAGS = $(module_flags)
libextract_icon_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# ISO
libextract_iso_la_SOURCES = tracker-extract-iso.c
libextract_iso_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(LIBOSINFO_CFLAGS)

libextract_iso_la_LDFLAGS = $(module_flags)
libextract_iso_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(LIBOSINFO_LIBS)

# libav
libextract_libav_la_SOURCES = tracker-extract-libav.c
libextract_libav_la_CFLAGS = $(TRACKER_EXTRACT_MODULES_CFLAGS) \
	$(AVFORMAT_CFLAGS) \
	$(AVUTIL_CFLAGS) \
	$(AVCODEC_CFLAGS)
libextract_libav_la_LDFLAGS = $(module_flags)
libextract_libav_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS) \
	$(AVFORMAT_LIBS) \
	$(AVUTIL_LIBS) \
	$(AVCODEC_LIBS)


# BMP
libextract_bmp_la_SOURCES = tracker-extract-bmp.c
libextract_bmp_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_bmp_la_LDFLAGS = $(module_flags)
libextract_bmp_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

# Dummy
libextract_dummy_la_SOURCES = tracker-extract-dummy.c
libextract_dummy_la_CFLAGS = \
	$(TRACKER_EXTRACT_MODULES_CFLAGS)
libextract_dummy_la_LDFLAGS = $(module_flags)
libextract_dummy_la_LIBADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_MODULES_LIBS)

libexec_PROGRAMS = tracker-extract

tracker_extract_SOURCES = \
	tracker-config.c \
	tracker-config.h \
	tracker-extract.c \
	tracker-extract.h \
	tracker-extract-controller.c \
	tracker-extract-controller.h \
	tracker-extract-decorator.c \
	tracker-extract-decorator.h \
	tracker-extract-persistence.c \
	tracker-extract-persistence.h \
	tracker-extract-priority-dbus.c \
	tracker-extract-priority-dbus.h \
	tracker-read.c \
	tracker-read.h \
	tracker-main.c \
	tracker-main.h

tracker_extract_LDADD = \
	$(top_builddir)/src/libtracker-extract/libtracker-extract.la \
	$(top_builddir)/src/libtracker-miners-common/libtracker-miners-common.la \
	$(BUILD_LIBS) \
	$(TRACKER_EXTRACT_LIBS)

if HAVE_LIBGSF
tracker_extract_SOURCES += tracker-gsf.c tracker-gsf.h
tracker_extract_CFLAGS = $(LIBGSF_CFLAGS)
tracker_extract_LDADD += $(LIBGSF_LIBS)
endif

# do nothing, output as a side-effect
tracker-extract-priority-dbus.c: tracker-extract-priority-dbus-stamp
	@:

tracker-extract-priority-dbus.h: tracker-extract-priority-dbus-stamp
	@:

tracker-extract-priority-dbus-stamp: Makefile.am $(srcdir)/tracker-extract-priority.xml
	$(AM_V_GEN) $(GDBUS_CODEGEN) \
	              --interface-prefix org.freedesktop.Tracker1.Extract. \
	              --generate-c-code tracker-extract-priority-dbus \
	              --c-namespace TrackerExtractDBus \
	              $(srcdir)/tracker-extract-priority.xml
	touch $@

BUILT_SOURCES = \
	tracker-extract-priority-dbus.c \
	tracker-extract-priority-dbus.h \
	tracker-extract-priority-dbus-stamp \
	$(NULL)

CLEANFILES = $(BUILT_SOURCES)

EXTRA_DIST = $(rules_files)

# DBus services
%.service.in: %.service.in.in
	@sed -e "s|@libexecdir[@]|${libexecdir}|" $< > $@

servicedir = $(DBUS_SERVICES_DIR)
service_DATA = org.freedesktop.Tracker1.Miner.Extract.service

INTLTOOL_SERVICE_RULE='%.service:   %.service.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -d -u'
@INTLTOOL_SERVICE_RULE@

tracker-extract.service: tracker-extract.service.in Makefile
	@sed -e "s|@libexecdir[@]|${libexecdir}|" $< > $@

systemd_userdir = $(prefix)/lib/systemd/user
systemd_user_DATA = tracker-extract.service

install-data-hook:
	$(MKDIR_P) "$(DESTDIR)$(datadir)/tracker/miners" && \
	$(LN_S) -f "$(servicedir)/$(service_DATA)" \
                   "$(DESTDIR)$(datadir)/tracker/miners/$(service_DATA)"

uninstall-local:
	$(RM) "$(DESTDIR)$(datadir)/tracker/miners/$(service_DATA)" && \
	$(RM) "$(servicedir)/$(service_DATA)"

# Desktop files: First we fix the VERSION and libexecdir
%.desktop.in: %.desktop.in.in
	@sed -e "s|@libexecdir[@]|${libexecdir}|" \
	     -e "s|@VERSION[@]|${VERSION}|" $< > $@

autostartdir = $(sysconfdir)/xdg/autostart
autostart_DATA = tracker-extract.desktop

@INTLTOOL_DESKTOP_RULE@

# Configuration / GSettings
gsettings_ENUM_NAMESPACE = org.freedesktop.TrackerMiners
gsettings_ENUM_FILES = $(top_srcdir)/src/libtracker-miners-common/tracker-enums.h

gsettings_SCHEMAS = org.freedesktop.Tracker.Extract.gschema.xml

@INTLTOOL_XML_NOMERGE_RULE@

@GSETTINGS_RULES@

# Dist / Clean rules for all data
CLEANFILES += \
	$(autostart_DATA) \
	$(autostart_DATA:.desktop=.desktop.in) \
	$(service_DATA) \
	$(service_DATA:.service=.service.in) \
	$(systemd_user_DATA) \
	$(gsettings_SCHEMAS)

EXTRA_DIST += \
	$(autostart_DATA:.desktop=.desktop.in.in) \
	$(config_DATA) \
	$(service_DATA:.service=.service.in.in) \
	$(systemd_user_DATA:.service=.service.in) \
	$(gsettings_SCHEMAS:.xml=.xml.in) \
	tracker-extract-priority.xml \
	meson.build
