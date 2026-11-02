-- Supabase Dashboard -> SQL Editor te ekbar run koro

create table if not exists public.media (
  id uuid primary key default gen_random_uuid(),
  title text,
  type text not null check (type in ('image', 'video')),
  url text not null,
  path text not null,
  created_at timestamptz not null default now()
);

alter table public.media enable row level security;

-- Sobai dekhte parbe
create policy "public read" on public.media
  for select using (true);

-- Shudhu login kora admin upload/delete korte parbe
create policy "admin insert" on public.media
  for insert to authenticated with check (true);
create policy "admin delete" on public.media
  for delete to authenticated using (true);

-- Storage bucket (public)
insert into storage.buckets (id, name, public)
values ('media', 'media', true)
on conflict (id) do nothing;

create policy "public read files" on storage.objects
  for select using (bucket_id = 'media');
create policy "admin upload files" on storage.objects
  for insert to authenticated with check (bucket_id = 'media');
create policy "admin delete files" on storage.objects
  for delete to authenticated using (bucket_id = 'media');
