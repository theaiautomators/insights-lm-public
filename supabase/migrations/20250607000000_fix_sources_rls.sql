-- Enable RLS on sources table
ALTER TABLE public.sources ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if any
DROP POLICY IF EXISTS "Users can view their own sources" ON public.sources;
DROP POLICY IF EXISTS "Users can create sources for their notebooks" ON public.sources;
DROP POLICY IF EXISTS "Users can update their own sources" ON public.sources;
DROP POLICY IF EXISTS "Users can delete their own sources" ON public.sources;

-- Create RLS policies for sources table
CREATE POLICY "Users can view their own sources"
ON public.sources FOR SELECT
USING (
  notebook_id IN (
    SELECT id FROM public.notebooks WHERE user_id = auth.uid()
  )
);

CREATE POLICY "Users can create sources for their notebooks"
ON public.sources FOR INSERT
WITH CHECK (
  notebook_id IN (
    SELECT id FROM public.notebooks WHERE user_id = auth.uid()
  )
);

CREATE POLICY "Users can update their own sources"
ON public.sources FOR UPDATE
USING (
  notebook_id IN (
    SELECT id FROM public.notebooks WHERE user_id = auth.uid()
  )
);

CREATE POLICY "Users can delete their own sources"
ON public.sources FOR DELETE
USING (
  notebook_id IN (
    SELECT id FROM public.notebooks WHERE user_id = auth.uid()
  )
);