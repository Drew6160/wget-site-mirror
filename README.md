# wget-site-mirror

A simple shell script to download and mirror an entire website for offline browsing, using `wget`.

---

## Usage

```bash
chmod +x mirror-site.sh
./mirror-site.sh https://example.com
```

Or run the command directly:

```bash
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent \
     --wait=2 --random-wait --limit-rate=200k -c \
     https://example.com
```

---

## What Each Flag Does

| Flag | Description |
|------|-------------|
| `--mirror` | Enables recursive download with infinite depth and timestamps |
| `--convert-links` | Rewrites links to point to local files for offline browsing |
| `--adjust-extension` | Adds `.html` extension where needed so browsers open files correctly |
| `--page-requisites` | Downloads all assets a page needs (CSS, images, JS) |
| `--no-parent` | Prevents crawling up to parent directories |
| `--wait=2` | Waits 2 seconds between requests |
| `--random-wait` | Randomizes wait time (0.5x–1.5x of `--wait`) to mimic human browsing |
| `--limit-rate=200k` | Caps download speed at 200KB/s to avoid hammering the server |
| `-c` | Resumes a partially completed download |

---

## Targeting a Subdirectory

To mirror only a specific section of a site:

```bash
./mirror-site.sh https://example.com/docs/
```

---

## Optional Extras

Save to a specific local folder:
```bash
wget ... -P ./my-folder https://example.com
```

Strip the hostname from the local folder structure:
```bash
wget ... -nH https://example.com
```

Increase throttling for stricter servers:
```bash
wget ... --wait=3 --limit-rate=100k https://example.com
```

---

## Requirements

- `wget` must be installed
  - **Mac:** `brew install wget`
  - **Linux (Debian/Ubuntu):** `sudo apt install wget`
  - **Windows:** Use WSL or download from [eternallybored.org](https://eternallybored.org/misc/wget/)
