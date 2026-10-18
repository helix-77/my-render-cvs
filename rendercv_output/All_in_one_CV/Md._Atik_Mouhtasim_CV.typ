// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.3.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Md. Atik Mouhtasim",
  title: "Md. Atik Mouhtasim - CV",
  footer: context { [#emph[Md. Atik Mouhtasim -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Oct 2026] ],
  locale-catalog-language: "en",
  text-direction: ltr,
  page-size: "us-letter",
  page-top-margin: 0.5in,
  page-bottom-margin: 0.5in,
  page-left-margin: 0.5in,
  page-right-margin: 0.5in,
  page-show-footer: true,
  page-show-top-note: false,
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(0, 0, 0),
  colors-headline: rgb(0, 0, 0),
  colors-connections: rgb(0, 0, 0),
  colors-section-titles: rgb(0, 0, 0),
  colors-links: rgb(0, 0, 0),
  colors-footer: rgb(128, 128, 128),
  colors-top-note: rgb(128, 128, 128),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "XCharter",
  typography-font-family-name: "XCharter",
  typography-font-family-headline: "XCharter",
  typography-font-family-connections: "XCharter",
  typography-font-family-section-titles: "XCharter",
  typography-font-size-body: 10pt,
  typography-font-size-name: 25pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 9pt,
  typography-font-size-section-titles: 1.3em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: false,
  links-show-external-link-icon: true,
  header-alignment: center,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.5cm,
  header-space-below-headline: 0.5cm,
  header-space-below-connections: 0.5cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: false,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "•",
  header-connections-space-between-connections: 0.4cm,
  section-titles-type: "centered_with_centered_partial_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.5cm,
  section-titles-space-below: 0.2cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.3em,
  sections-space-between-regular-entries: 1em,
  entries-date-and-location-width: 4.15cm,
  entries-side-space: 0.2cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: false,
  entries-short-second-row: false,
  entries-degree-width: 1cm,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "•" ,
  entries-highlights-space-left: 0.15cm,
  entries-highlights-space-above: 0cm,
  entries-highlights-space-between-items: 0cm,
  entries-highlights-space-between-bullet-and-text: 0.5em,
  date: datetime(
    year: 2026,
    month: 10,
    day: 19,
  ),
)


= Md. Atik Mouhtasim

  #headline([Aspiring AI\/ML Researcher | Web & Mobile App Developer])

#connections(
  [Banasree, Dhaka, Bangladesh],
  [#link("mailto:mdatikmouhtasim@gmail.com", icon: false, if-underline: false, if-color: false)[mdatikmouhtasim\@gmail.com]],
  [#link("tel:+880-1719-345888", icon: false, if-underline: false, if-color: false)[01719-345888]],
  [#link("https://github.com/helix-77", icon: false, if-underline: false, if-color: false)[helix-77]],
  [#link("https://linkedin.com/in/mdatik2003118", icon: false, if-underline: false, if-color: false)[mdatik2003118]],
  [#link("https://atikrahi.dev/", icon: false, if-underline: false, if-color: false)[atikrahi.dev]],
)


== Summary

Computer Science student specializing in AI systems, dataset quality, and cross-platform application development. Hands-on experience validating autonomous-driving datasets for self-supervised monocular TTC estimation and building web and mobile applications using Flutter, React Native, Next.js, Firebase, and Supabase.

== Education

#education-entry(
  [
    #strong[Rajshahi University of Engineering & Technology], B.Sc. in Computer Science and Engineering (CSE) -- Rajshahi

  ],
  [
    Dec 2021 – Aug 2026

  ],
  degree-column: [
    #strong[B.Sc.]
  ],
  main-column-second-row: [
    #summary[CGPA: 3.53\/4.0]

  ],
)

#education-entry(
  [
    #strong[Notre Dame College], HSC in Science -- Dhaka

  ],
  [
    Jan 2018 – Jan 2020

  ],
  degree-column: [
    #strong[HSC]
  ],
  main-column-second-row: [
    #summary[GPA: 5.0\/5.0]

  ],
)

#education-entry(
  [
    #strong[Thakurgaon Government Boys High School], SSC -- Thakurgaon

  ],
  [
    Jan 2010 – Jan 2018

  ],
  degree-column: [
    #strong[SSC]
  ],
  main-column-second-row: [
    #summary[GPA: 5.0\/5.0]

  ],
)

== Experience

#regular-entry(
  [
    #strong[RUET Computing Society], General Secretary

  ],
  [
    Nov 2025 – Sept 2026

  ],
  main-column-second-row: [
    - Led execution of plans by distributing responsibilities and managing manpower across multiple activities.

    - Handled internal coordination and issue resolution to maintain a productive club environment.

    - Oversaw timelines to ensure all administrative and technical activities are completed on time.

  ],
)

#regular-entry(
  [
    #strong[Texlab IT], Industrial Trainee

  ],
  [
    Mar 2025 – Apr 2025

  ],
  main-column-second-row: [
    - Gained hands-on experience in a professional software development environment

    - Learned collaboration, issue tracking, and async communication using GitHub and Slack

    - Developed a strong foundation in professionalism, workplace ethics and industry standard workflows

  ],
)

== Projects

#regular-entry(
  [
    #strong[#link("https://github.com/helix-77/MediTrack")[MediTrack]]

  ],
  [
    Aug 2026 – Sept 2026

  ],
  main-column-second-row: [
    #summary[#emph[Tech Stack: Flutter, Dart, Firebase, ML Kit, Gemini, OpenRouter]]

    - Built a bilingual medicine-management app for prescription scanning, dosage scheduling, adherence tracking, stock and refill alerts, and family profiles.

    - Designed a two-stage prescription pipeline combining on-device ML Kit OCR with Gemini extraction, schema validation, and mandatory user review before medication data is saved.

    - Implemented Firebase authentication and persistence, local reminders, an offline SQLite medicine catalog, and #strong[a context-aware AI assistant].

  ],
)

#regular-entry(
  [
    #strong[#link("https://github.com/helix-77/WasteGuard")[WasteGuard]]

  ],
  [
    May 2025 – present

  ],
  main-column-second-row: [
    #summary[#emph[Tech Stack: React Native (Expo), TypeScript, Supabase, NativeWind]]

    - Built a cross-platform food-waste management app for pantry inventory, expiry tracking, waste analytics, and recipe suggestions based on soon-to-expire ingredients.

    - Implemented cloud synchronization, push notifications, Supabase authentication and data storage, and TanStack Query server-state management.

  ],
)

#regular-entry(
  [
    #strong[#link("https://github.com/helix-77/Asteroid-Odyssey")[Asteroid Odyssey]]

  ],
  [
    Sept 2025 – Oct 2025

  ],
  main-column-second-row: [
    #summary[#emph[Tech Stack: NASA APIs, Next.js, TypeScript, Three.js, D3.js]]

    - Led a five-person team as team leader and lead developer for NASA Space Apps 2025.

    - Built a 3D asteroid-impact simulator that explores more than 100 objects and models mitigation strategies and global effects over a 50-year timeline.

    - Integrated NASA NEO, JPL Small-Body Database, Sentry, and Fireball data with interactive visualizations for orbital exploration, threat assessment, and impact analysis.

  ],
)

#regular-entry(
  [
    #strong[#link("https://github.com/helix-77/Prayer.time")[Prayer.time]]

  ],
  [
    Feb 2026

  ],
  main-column-second-row: [
    #summary[#emph[Tech Stack: React, TypeScript, Vite, Tailwind CSS]]

    - Built a privacy-first browser extension for prayer-time and Ramadan countdowns without continuous GPS tracking.

    - Integrated prayer-time calculation through adhan, OpenStreetMap Nominatim city search, 11 calculation methods, and per-prayer time calibration.

    - Implemented service-worker alarms, cross-tab browser notifications, and in-app alerts; published releases for Edge, Firefox, and Chromium browsers.

  ],
)

#regular-entry(
  [
    #strong[#link("https://github.com/helix-77/UniCompanion")[UniCompanion]]

  ],
  [
    2024

  ],
  main-column-second-row: [
    #summary[#emph[Tech Stack: React Native (Expo), Supabase, TypeScript, NativeWind]]

    - Built a cross-platform academic management application for students and teachers using React Native, Expo, and Supabase.

    - Implemented attendance tracking with CSV and Excel export, class and content management, CT and lab assessments, course enrollment, and in-app messaging.

    - Integrated Google OAuth, cloud storage, and NativeWind interface components to support authenticated teacher and student workflows.

  ],
)

== Research

#regular-entry(
  [
    #strong[MonoTTC: Object-Level Time-to-Contact Estimation under Limited Supervision]

  ],
  [
    Aug 2026

  ],
  main-column-second-row: [
    #summary[B.Sc. thesis supervised by Farjana Parvin, Department of CSE, RUET]

    - Developed a two-stage PyTorch pipeline combining self-supervised ResNet-18 and PoseNet geometry pretraining on temporal nuScenes triplets with ROI-supervised TTC adaptation using frozen RAFT-Small.

    - Derived audited metric TTC targets from nuScenes 3D tracks, calibrated ego poses, and camera geometry using scene-disjoint splits, a 25\% label budget, and a single 16 GB GPU.

    - Across five seeds and 87 validation scenes, geometric consistency produced a 5.33\% descriptive reduction in scene-balanced relative TTC error from 0.4131 ± 0.0186 to 0.3911 ± 0.0178.

    - Reduced absolute MAE for urgent 0–2 s TTC targets from 2.1075 s to 1.6826 s; the paired 95\% confidence interval included zero, so the overall improvement was not statistically significant.

    - Achieved AUROC of 0.8667 ± 0.0256 and AUPRC of 0.2080 ± 0.0493 for oracle risk classification of critical targets with TTC ≤ 2.0 s.

  ],
)

== Skills

#strong[Programming Languages:] Python, JavaScript, TypeScript, Dart, C++, HTML, CSS, PHP

#strong[AI\/ML:] PyTorch, torchvision, Kornia, NumPy, SciPy, Scikit-learn, OpenCV, Seaborn

#strong[Frontend:] React, Next.js, React Native (Expo), Flutter, Three.js, D3.js

#strong[Backend:] Supabase\/PostgreSQL, Firebase, SQLite, MySQL, Laravel

#strong[Tools:] Linux, Docker, Git, GitHub, Tectonic

#strong[Agents:] OpenCode TUI, Codex-CLI, Claude Code, Deepseek-harness, OpenChamber

== Certifications

- Industrial Trainee, Texlab IT — #link("https://drive.google.com/file/d/1skMye3X4RtOzmVUftdvk_J23vx2N69bT/view?usp=sharing")[Certificate]

- EDGE Course (PHP, Laravel), Bangladesh Computer Council and RUET — #link("https://drive.google.com/file/d/1IdImGvJciYqiqodXvjmYWNethrYLvozw/view?usp=sharing")[Certificate]

- Supervised Machine Learning: Regression and Classification, Coursera — #link("https://www.coursera.org/account/accomplishments/verify/UKGEVW72STB3?utm_source=link&utm_medium=certificate&utm_content=cert_image&utm_campaign=sharing_cta&utm_product=course")[Certificate]

- Web Development Bootcamp, Programming Hero — #link("https://drive.google.com/file/d/1OG7OChaf5s1IydVR6wY-qutZ7pN_wERw/view?usp=drive_link")[Certificate]

== References

  #regular-entry(
  [
    #strong[Farjana Parvin]

  ],
  [
  ],
  main-column-second-row: [
    #summary[Assistant Professor, Department of CSE, RUET | Email: farjana.sumona94\@gmail.com | Phone: +8801739497360]

  ],
)

  #regular-entry(
  [
    #strong[Md. Azmain Yakin Srizon]

  ],
  [
  ],
  main-column-second-row: [
    #summary[Assistant Professor, Department of CSE, RUET | Email: azmainsrizon\@cse.ruet.ac.bd | Phone: +8801790187189]

  ],
)
