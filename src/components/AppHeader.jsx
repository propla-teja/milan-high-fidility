export default function AppHeader({ totalScreens, search, onSearch }) {
  return (
    <header className="rounded-3xl bg-gradient-to-r from-milan-deep via-milan-medium to-milan-accent p-6 text-white shadow-card">
      <p className="text-sm uppercase tracking-[0.2em] text-white/70">Milan Professionals</p>
      <h1 className="mt-2 text-3xl font-bold">50+ Product Screens</h1>
      <p className="mt-2 text-sm text-white/90">React + Tailwind UI with mock JSON server integration and reusable components.</p>
      <div className="mt-4 grid gap-3 md:grid-cols-[1fr_auto]">
        <input
          className="rounded-xl border border-white/30 bg-white/10 px-4 py-3 text-white placeholder:text-white/70 focus:outline-none focus:ring-2 focus:ring-white"
          placeholder="Search by screen name or status"
          value={search}
          onChange={(event) => onSearch(event.target.value)}
        />
        <div className="rounded-xl bg-white/20 px-4 py-3 text-sm font-semibold">{totalScreens} screens loaded</div>
      </div>
    </header>
  );
}
