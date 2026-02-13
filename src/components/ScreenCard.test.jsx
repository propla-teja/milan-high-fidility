import { render, screen } from '@testing-library/react';
import ScreenCard from './ScreenCard';

const mockScreen = {
  id: 1,
  title: 'OTP Screen',
  status: 'ready',
  description: 'Enter OTP for phone verification.',
  flow: 'Onboarding',
  image: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=900'
};

describe('ScreenCard', () => {
  it('renders title, description and flow', () => {
    render(<ScreenCard screen={mockScreen} />);

    expect(screen.getByText('OTP Screen')).toBeInTheDocument();
    expect(screen.getByText('Enter OTP for phone verification.')).toBeInTheDocument();
    expect(screen.getByText('Onboarding')).toBeInTheDocument();
  });
});
