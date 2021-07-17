#include <stdio.h>

typedef struct	s_list
{
	void			*content;
	struct s_list	*next;
}				t_list;

int		ft_strcmp(char *str1, char *str2);
int		ft_atoi_base(char *str, char *base);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref,
		int (*cmp)());

void	print_list(t_list *begin_list)
{
	int i = 1;

	while (begin_list)
	{
		printf("%d elem - ", i++);
		printf("%s\n", (char *)begin_list->content);
		begin_list = begin_list->next;
	}
}

int main(void)
{
	printf("%d\n", ft_atoi_base("111", "01"));
	printf("%d\n", ft_atoi_base("314", "314"));

	printf("----------\n");
	
	t_list *begin_list = NULL;
	char *data1 = "45";
	char *data2 = "53";
	char *data3 = "85";
	char *data4 = "15";
	char *data5 = "5";

	ft_list_push_front(&begin_list, data1);
	ft_list_push_front(&begin_list, data2);
	ft_list_push_front(&begin_list, data3);
	ft_list_push_front(&begin_list, data4);
	ft_list_push_front(&begin_list, data5);
	print_list(begin_list);
	
	printf("----------\n");
	
	printf("list_size - %d\n", ft_list_size(begin_list));

	ft_list_sort(&begin_list, ft_strcmp);
	print_list(begin_list);
	
	printf("----------\n");

	ft_list_remove_if(&begin_list, "85", ft_strcmp);
	print_list(begin_list);
	printf("----------\n");
	ft_list_remove_if(&begin_list, "15", ft_strcmp);
	print_list(begin_list);
}
