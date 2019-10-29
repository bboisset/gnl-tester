int main (int argc, char **argv)
{
	int i = 1;
	if (argc > 1)
	{
		while (i < argc)
		{
			char *line;
			//line = malloc(10000 * sizeof(char*));
			int fd = open(argv[i++], O_RDONLY);
			while (get_next_line(fd,&line) == 1)
			{
				printf("%s\n", line);
				free(line);
			}
			printf("%s", line);
		}
	}
	return (0);
}

