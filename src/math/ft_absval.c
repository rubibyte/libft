/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_absval.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: xrodrigu <xrodrigu@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/20 19:47:22 by xrodrigu          #+#    #+#             */
/*   Updated: 2022/11/11 19:14:11 by xrodrigu         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

long	ft_absval(long n)
{
	if (n < 0)
		n = -n;
	return (n);
}
