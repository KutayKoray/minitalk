#include "minitalk.h"

static void	putnbr(int nb)
{
	char	c_nbr;

	if (nb >= 0 && nb <= 9)
	{
		c_nbr = nb + 48;
		write(1, &c_nbr, 1);
	}
	else if (nb >= 10)
	{
		putnbr(nb / 10);
		c_nbr = (nb % 10) + 48;
		write(1, &c_nbr, 1);
	}
}

static void	handle_signal(int signbr)
{
	static int	ascii = 0;
	static int	power = 0;

	if (signbr == SIGUSR1)
		ascii += 1 << power;
	power++;
	if (power == 8)
	{
		write(1, &ascii, 1);
		if (ascii == 0)
			write(1, "\n", 1);
		ascii = 0;
		power = 0;
	}
}

int	main(void)
{
	int	pid;

	pid = (int)(getpid());
	write(1, "serverPID: ", 12);
	putnbr(pid);
	write(1, "\n", 1);
	signal(SIGUSR1, handle_signal);
	signal(SIGUSR2, handle_signal);
	while (1)
		pause();
	return (0);
}
