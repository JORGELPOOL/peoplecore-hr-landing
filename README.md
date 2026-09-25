# PeopleCore Flutter Landing Page

A responsive Flutter marketing website for the PeopleCore HR Portal.

## Run

```bash
flutter pub get
flutter run -d chrome
```

## Production web build

```bash
flutter build web --release
```

Deploy the contents of `build/web/` to a static host such as Render, Netlify, Vercel, Cloudflare Pages, or GitHub Pages.

## Before publishing

Replace:
- `hello@peoplecore.example` with your real sales/demo email.
- `https://example.com` with your live PeopleCore application URL.

The page includes:
- Responsive hero section
- PeopleCore dashboard visual
- Professional profile image
- Features
- Employee lifecycle
- Role-based benefits
- Demo CTA
- FAQ
- Responsive mobile navigation
- SEO-ready page title through Flutter web configuration can be added in `web/index.html`

## Suggested deployment

GitHub -> Render/Vercel/Netlify for the Flutter landing page.

Keep the marketing site separate from the authenticated PeopleCore HR application.
