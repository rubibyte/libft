/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: xrodrigu <xrodrigu@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/15 14:43:33 by xrodrigu          #+#    #+#             */
/*   Updated: 2022/11/29 21:10:37 by xrodrigu         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlcat(char *dst, const char *src, size_t dstsize)
{
	size_t	dst_len;
	int		i;

	dst_len = ft_strlen(dst);
	if (dstsize <= dst_len)
		return (dstsize + ft_strlen(src));
	i = -1;
	while (src[++i] && (dst_len + 1 < dstsize))
	{
		dst[dst_len] = src[i];
		dst_len++;
	}
	dst[dst_len] = '\0';
	return (ft_strlen(dst) + ft_strlen(&src[i]));
}
