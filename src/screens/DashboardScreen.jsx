import AppHeader from '../components/AppHeader';
import SectionBlock from '../components/SectionBlock';
import { useScreensData } from '../hooks/useScreensData';

export default function DashboardScreen() {
  const { filteredSections, loading, error, search, setSearch } = useScreensData();
  const totalScreens = filteredSections.reduce((acc, section) => acc + section.screens.length, 0);

  if (loading) {
    return <div className="p-10 text-center text-lg text-violet-700">Loading Milan screens…</div>;
  }

  if (error) {
    return <div className="p-10 text-center text-lg text-rose-600">{error}</div>;
  }

  return (
    <div className="mx-auto max-w-7xl space-y-8 p-4 md:p-8">
      <AppHeader totalScreens={totalScreens} search={search} onSearch={setSearch} />
      {filteredSections.length === 0 ? (
        <div className="rounded-2xl bg-white p-10 text-center text-slate-500 shadow-card">No screens match your search.</div>
      ) : (
        filteredSections.map((section) => <SectionBlock key={section.id} section={section} />)
      )}
    </div>
  );
}
