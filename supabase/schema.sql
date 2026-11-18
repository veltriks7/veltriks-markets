
create table public.trades (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid()
    references auth.users(id) on delete cascade,
  market text not null,
  symbol text not null,
  direction text not null,
  result text not null,
  entry_price numeric,
  exit_price numeric,
  rr numeric,
  pnl numeric not null,
  trade_date date not null default current_date,
  session text,
  notes text,
  created_at timestamptz default now()
);

alter table public.trades enable row level security;

create policy "Members can read their own trades"
on public.trades for select to authenticated
using (auth.uid() = user_id);

create policy "Members can add their own trades"
on public.trades for insert to authenticated
with check (auth.uid() = user_id);

create policy "Members can update their own trades"
on public.trades for update to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Members can delete their own trades"
on public.trades for delete to authenticated
using (auth.uid() = user_id);

grant select, insert, update, delete
on public.trades to authenticated;
