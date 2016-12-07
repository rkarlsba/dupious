# dupious
## Find duplicate files across filesystems and servers (soon)

Written by Roy Sigurd Karlsbakk <roy@karlsbakk.net>

This software is written to find and inspect file trees to check for identical
files. It has (or will be) extended to do various other pattern analysis. As for
now, at 0.3.0, it's at the start of a major rewrite, so please don't expect it
to work unless it's on a sunny day with 1.02m/s wind from south-east, and be
happy if it does, even then.

--

Run modes:

	* Init  
In init mode, traverse through a directory, default "." and build an SQLite database of SHA256 and MD5 hashes for all files. Later, in check mode, scan through the SQLite database and report duplicate files. Since both hashes are checked, the chance of hash collisions should be minimal (e.g. zero).
	* Show duplicates


--

_Old stuff_

# In init mode, traverse through a directory, default "." and build an SQLite
# database of SHA256 and MD5 hashes for all files. Later, in check mode, scan
# through the SQLite database and report duplicate files. Since both hashes are
# checked, the chance of hash collisions should be minimal (e.g. zero).
#
# Usage:
# 
# First create the database with the hashes:
#
# ./dupious --init [ --datapath /path/to/somewhere ]
#
# After that, check for duplicates:
#
# ./dupious --show-duplicates [ --datapath /path/to/somewhere ]
#
# If path isn't given, default to current directory (.)
#
# CHANGELOG
#
# 0.0.1:
#   - Initial release
#
# 0.0.2:
#   - Initial usable release
#
# 0.0.3:
#   - Ignore non-readable files (skip them if md5_sum fails).
#
# 0.0.4:
#   - Skip non-ordniary files like devices, pipes etc
#
# 0.0.5:
#   - Don't follow symlinks unless --follow-symlinks or -F is given
#
# 0.0.6:
#   - Fix database initialization
#   - Add max and min size for both init and report
#
# 0.1.0:
#   - Fix: Don't report hardlinks as matches
#   - Fix: Don't checksum empty files
# 	- Feature: Add threading for supported OSes and files over a given limit (1MB standard).
#   - Feature: Add updating the index with --update, only updating the hashes for files that have a changed
#     mtime since last scan. This also adds new files.
#
# 0.1.1:
#   - Fix: Allow bundled arguments
#   - Feature: Add --cleanup to remove old files from index
#
# 0.1.2:
#   - Fix: A bunch
#
# 0.1.3:
#   - Feature: Added --hardlink-duplicates (unstable)
#   - Bug: --update can't handle hardlinks yet
#
# 0.1.4:
#   - Moved cleanup to updated - added notice for explicit cleanup, and removed cleanup from the
#     help page. Thanks to Håkon Struijk Holmen <haakonsh@gmail.com for feedback.
#
# 0.2.0:
#   - Fixed --path support for handle_duplicates so that filtering on path with --show-duplicates
#     works.
#
# DATABASE INITIALISATION (BETA!)
# 
# Due to its nature, sqlite database is initiated automatically with -I. For PostgreSQL and MySQL,
# database and table (one for now) must be created manually along with granting rights to the user.
#
# PostgreSQL:
#   CREATE TABLE hashes(
#     filename varchar(500) NOT NULL UNIQUE,
#     inode integer,
#     size integer,
#     mtime integer,
#     dev integer,
#     md5 varchar(32),
#     sha256 varchar(64)
#   );
#
# TODO
#
# - Rewrite to relative paths, being compatible with crossmounting
# - Allow for reuse of database files found in subdirectories traversed.
# - Allow for other database backends - SQLite might be a bit light for larger setups
# - Update must take inode into account after --hardlink-duplicates
#
# Roy Sigurd Karlsbakk <roy@karlsbakk.net>
#
So far, most of the documentation is in the dupious script itself, on top, as
comments.

## packages needed

yum install libdbi-dbd-sqlite perl-DBD-SQLite

## License

This code is licensed under [AGPL](https://www.gnu.org/licenses/agpl-3.0.en.html) v3 or later.

roy <roy@karlsbakk.net>

vim:tw=80
