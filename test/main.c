#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>

ssize_t	ft_read(int fd, void *buf, size_t count);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dest, const char *src);
char	*ft_strdup(const char *str);
size_t	ft_strlen(const char *str);
ssize_t	ft_write(int fd, const void *buf, size_t count);

int main()
{
	char *str1 = "gsdkjhgsjdkhgkjdhsadklfjslkjhklajlfsdjlkjhklsajfsldkjhkajs;dsflkajdslkdjfkfdgdsfkdsfjlkdsjgklsdjfkdfdlk";
	char buf[150];
	printf ("1 - my output\n2 - output of system functions\n\n");

	// ft_strlen
	printf("%ld\n", ft_strlen(""));
	printf("%ld\n", strlen(""));
	
	printf("%ld\n", ft_strlen(str1));
	printf("%ld\n", strlen(str1));

	// ft_strcpy
	printf("%s\n", ft_strcpy(buf, ""));
	printf("%s\n", strcpy(buf, ""));
	
	printf("%s\n", ft_strcpy(buf, str1));
	printf("%s\n", strcpy(buf, str1));

	// ft_strcmp
	printf("%d\n", ft_strcmp("\x02\x01", "\x01"));
	printf("%d\n", strcmp("\x02\x01", "\x01"));
	
	printf("%d\n", ft_strcmp("\xff\xff", "\xff"));
	printf("%d\n", strcmp("\xff\xff", "\xff"));

	printf("%d\n", ft_strcmp("\xff", "\xff\xfe"));
	printf("%d\n", strcmp("\xff", "\xff\xfe"));

	printf("%d\n", ft_strcmp("\xfe", "\xfe\xff"));
	printf("%d\n", strcmp("\xfe", "\xfe\xff"));

	printf("%d\n", ft_strcmp("\x02", "\x02\x01"));
	printf("%d\n", strcmp("\x02", "\x02\x01"));
	
	printf("%d\n", ft_strcmp("\xff", "\xff\xff"));
	printf("%d\n", strcmp("\xff", "\xff\xff"));

	printf("%d\n", ft_strcmp("\xff", "\xff\xfe"));
	printf("%d\n", strcmp("\xff", "\xff\xfe"));
	
	printf("%d\n", ft_strcmp("\xfe", "\xfe\xff"));
	printf("%d\n", strcmp("\xfe", "\xfe\xff"));

	// ft_write
	printf("%ld\n", ft_write(1, "Hello, world\n", 13));
//	printf("%s\n", strerror(errno));
	printf("%ld\n", write(1, "Hello, world\n", 13));
//	printf("%s\n", strerror(errno));

	int fd = open("test", O_CREAT | O_WRONLY, S_IREAD|S_IWRITE);
	printf("%ld\n", ft_write(fd, "Hello, world\n", 13));
//	printf("%s\n", strerror(errno));
	printf("%ld\n", write(fd, "Hello, world\n", 13));
//	printf("%s\n", strerror(errno));
	
	printf("%ld\n", ft_write(42, "Hello, world\n", 13));
//	printf("%s\n", strerror(errno));
	printf("%ld\n", write(42, "Hello, world\n", 13));
//	printf("%s\n", strerror(errno));

	// ft_read
	printf("\n%ld\n", ft_read(0, buf, 5));
	buf[5] = '\0';
	printf("%s\n", buf);
//	printf("%s\n", strerror(errno));

	printf("\n%ld\n", read(0, buf, 5));
	buf[5] = '\0';
	printf("%s\n", buf);
//	printf("%s\n", strerror(errno));

	int fd2 = open("main.c", O_RDONLY);
	printf("%ld\n", ft_read(fd2, buf, 10));
	buf[10] = '\0';
	printf("%s\n", buf);
//	printf("%s\n", strerror(errno));

	printf("%ld\n", read(fd2, buf, 10));
	buf[10] = '\0';
	printf("%s\n", buf);
//	printf("%s\n", strerror(errno));

	printf("%ld\n", ft_read(42, buf, 10));
//	printf("%s\n", strerror(errno));

	printf("%ld\n", read(42, buf, 10));
//	printf("%s\n", strerror(errno));

	//ft_strdup
	char *str = ft_strdup("");
	printf("%s\n", str);
	free(str);

	str = strdup("");
	printf("%s\n", str);
	free(str);

	str = ft_strdup(str1);
	printf("%s\n", str);
	free(str);
	
	str = strdup(str1);
	printf("%s\n", str);
	free(str);
	return (0);
}
