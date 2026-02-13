export default function ScreenCard({ screen }) {
  return (
    <article className="overflow-hidden rounded-3xl border border-violet-100 bg-white shadow-card transition hover:-translate-y-1">
      <img src={screen.image} alt={screen.title} className="h-40 w-full object-cover" />
      <div className="space-y-3 p-4">
        <div className="flex items-center justify-between gap-3">
          <h3 className="line-clamp-1 text-base font-semibold text-slate-800">{screen.title}</h3>
          <span className="rounded-full bg-violet-100 px-3 py-1 text-xs font-medium text-violet-800">{screen.status}</span>
        </div>
        <p className="line-clamp-2 text-sm text-slate-500">{screen.description}</p>
        <div className="flex items-center justify-between">
          <span className="text-xs font-medium uppercase tracking-widest text-slate-400">{screen.flow}</span>
          <button className="rounded-lg bg-gradient-to-r from-milan-medium to-milan-accent px-3 py-2 text-xs font-semibold text-white">Preview</button>
        </div>
      </div>
    </article>
  );
}
