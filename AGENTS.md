# Repository guidance

## Render flow

- This repo uses RenderCV v2.8. The root `*.yaml` files other than `design.yaml`, `locale.yaml`, and `settings.yaml` are CV inputs.
- Run the full build with `./render_all.sh`. It renders every CV into `rendercv_output/<yaml-basename>/` using the shared `design.yaml`, `locale.yaml`, and `settings.yaml`.
- Render one CV with:
  ```bash
  rendercv render All_in_one_CV.yaml -d design.yaml -lc locale.yaml -s settings.yaml -o rendercv_output/All_in_one_CV --dont-generate-markdown
  ```
  This direct command leaves a generated `.typ`; clean it or use `./render_all.sh` after a one-off render. Use `./render_all.sh --watch <yaml-file>` for live editing; Ctrl+C cleans temporary Typst/Markdown/HTML files.
- `render_all.sh` deliberately removes generated `.typ`, `.md`, and `.html` files after rendering; the expected deliverables are PDFs and page PNGs. Treat `rendercv_output/` as generated and rerender instead of editing it.
- `render_all.sh` has no fail-fast handling and can end with status 0 after an earlier render failure. Check its output and verify every expected PDF/PNG exists.
- RenderCV output naming uses the YAML basename for the subfolder, but output filenames use `cv.name`.

## Source-of-truth and editing rules

- The render scripts always pass the split config files, and CLI-loaded RenderCV config overrides embedded `design:`, `locale:`, and `settings:` sections. Put shared styling in `design.yaml`, translations in `locale.yaml`, and output/render settings in `settings.yaml`; edit CV content in the target `*.yaml` only.
- `settings.yaml` disables Markdown and HTML generation. The shell scripts also pass `--dont-generate-markdown` and clean intermediate files.
- Keep RenderCV v2.8 schema compatibility. In particular, quote YAML string values containing `:`, use strict `YYYY`, `YYYY-MM`, or `YYYY-MM-DD` values for `start_date`/`end_date`, and keep each section to one entry type.
- The repo-local `.agents/skills/rendercv/SKILL.md` contains the authoritative RenderCV CLI/schema reference; consult it when changing unfamiliar fields.

## Verification

- There is no test, lint, or typecheck suite in this repository. After rendering, inspect the generated PDF or per-page PNGs for parse errors, page count, overflow, and layout regressions.
- After changing shell scripts, run `bash -n render_all.sh live_edit.sh`.
