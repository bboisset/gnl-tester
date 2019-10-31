#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

int main (int argc, char **argv)
{
	int i = 1;
	if (argc > 1)
	{
		while (i < argc)
		{
			char *line;
			int fd = open(argv[i++], O_RDONLY);
			while (get_next_line(fd,&line) == 1)
			{
				printf("%s\n", line);
				free(line);
			}
			printf("%s", line);
			free(line);
		}
	}
	return (0);
}

