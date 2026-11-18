# VELTRIKS MARKETS — Trading Journal

A responsive member trading journal starter with:
- Private member sign-up/sign-in (Supabase Auth)
- Per-user trade privacy enforced by Supabase Row Level Security (RLS)
- Forex, Gold, Indices, Crypto and Stocks
- Black + blue dark mode and white light mode
- Trade history, daily date, session, notes, P/L, R multiple
- Performance metrics and CSV export

## 1. Create the database and login service
1. Create a free project at https://supabase.com/
2. Open **SQL Editor** in your Supabase project.
3. Paste and run all of `supabase/schema.sql`.
4. Open **Project Settings → API** and copy the Project URL and anon/public key.

## 2. Connect the website
Open `index.html` in a text editor. Near the bottom, replace:
- `YOUR_SUPABASE_PROJECT_URL`
- `YOUR_SUPABASE_ANON_KEY`

Use the **anon/public** key only. Never put a Supabase `service_role` key in browser code.

## 3. Publish online for free
1. Create a GitHub repository and upload `index.html` and the `supabase` folder.
2. In Cloudflare Pages, choose **Create a project → Connect to Git**.
3. Select the repository. For a plain static site, leave build command empty and set output directory to `/` (or use the repository root, depending on the Pages UI).
4. Deploy. Your `*.pages.dev` URL is the live website.

You can also test locally by opening `index.html` after configuring Supabase.

## Privacy and production notes
- Supabase RLS policies restrict each signed-in user to rows where `user_id = auth.uid()`. Do not disable RLS.
- Configure Supabase Auth email confirmation and allowed redirect URLs for your deployed domain.
- This starter does not include admin access to member trades, broker integrations, automatic price feeds, image uploads, or password reset UI.
- Add stronger validation, rate limits/abuse controls, backups, and privacy/terms pages before a large public launch.
- Free tiers have usage limits and can change; check provider pricing before inviting a large community.
- The P/L field is manually entered. It is a journal, not an execution platform or investment advice.
