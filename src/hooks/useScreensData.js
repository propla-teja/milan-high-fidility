import { useEffect, useMemo, useState } from 'react';
import axios from 'axios';

const API_BASE = import.meta.env.VITE_API_URL || 'http://localhost:3001';

export function useScreensData() {
  const [sections, setSections] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [search, setSearch] = useState('');

  useEffect(() => {
    async function loadData() {
      try {
        setLoading(true);
        const { data } = await axios.get(`${API_BASE}/sections?_embed=screens`);
        setSections(data);
      } catch (err) {
        setError(err.message || 'Failed to load screens');
      } finally {
        setLoading(false);
      }
    }

    loadData();
  }, []);

  const filteredSections = useMemo(() => {
    if (!search) return sections;
    const term = search.toLowerCase();
    return sections
      .map((section) => ({
        ...section,
        screens: section.screens.filter((screen) => screen.title.toLowerCase().includes(term) || screen.status.toLowerCase().includes(term))
      }))
      .filter((section) => section.screens.length > 0);
  }, [sections, search]);

  return { filteredSections, loading, error, search, setSearch };
}
