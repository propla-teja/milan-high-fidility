import ScreenCard from './ScreenCard';

export default function SectionBlock({ section }) {
  return (
    <section className="space-y-4">
      <div className="flex items-end justify-between">
        <div>
          <h2 className="text-xl font-bold text-slate-900">{section.name}</h2>
          <p className="text-sm text-slate-500">{section.description}</p>
        </div>
        <span className="rounded-full bg-violet-100 px-3 py-1 text-xs font-semibold text-violet-700">{section.screens.length} screens</span>
      </div>
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
        {section.screens.map((screen) => (
          <ScreenCard key={screen.id} screen={screen} />
        ))}
      </div>
    </section>
  );
}
