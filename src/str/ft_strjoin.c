/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: xrodrigu <xrodrigu@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/22 13:34:46 by xrodrigu          #+#    #+#             */
/*   Updated: 2022/11/29 21:07:30 by xrodrigu         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	char	*new_s;
	int		i;
	int		j;

	new_s = (char *)malloc((ft_strlen(s1) + ft_strlen(s2)) * sizeof(char) + 1);
	if (!new_s)
		return (NULL);
	i = -1;
	while (s1[++i])
		new_s[i] = (char)s1[i];
	j = -1;
	while (s2[++j])
		new_s[i + j] = (char)s2[j];
	new_s[i + j] = '\0';
	return (new_s);
}
