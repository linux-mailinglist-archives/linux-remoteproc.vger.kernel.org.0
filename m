Return-Path: <linux-remoteproc+bounces-454-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D55F84A369
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 20:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B33FB2AD11
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 19:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE7961662;
	Mon,  5 Feb 2024 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0IFu7iQq"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F18612DF;
	Mon,  5 Feb 2024 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159794; cv=none; b=kX+autsf2yHqxh3eNFyrYmYnizYYstqqwRTVBO9r98NAMvzsv28/x4TU3yu6EZnkpa4In96d5880KMW2Vc4y3Lx4fvpLhrPds9WvlHP+C+1ojUuYiPth7c4d89fSWyqz9FSMA4fBF/i64zPqljGMfXmq6tSIUQdRTczetsrN12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159794; c=relaxed/simple;
	bh=NPy4Qjb0aNJaUt1anX4DLKcJO8MAHo9hxB1lf/SnJVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAEBQHvekHpSDMj/3zI+K7BWt+3xABMxwhHgbC/1bfQ18kjd4cmh9RYxITY55FzD/UZgKy3cWS56/cUv+OsD4pPWeC9NtVMf9S3JGeaz6hGQxbXuW11KmEPhJ0k3n1sFgaCdCmcaLM7pDPu8o8Hk2Cb/qL7gWvwbnAc3XLso/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0IFu7iQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E38C433C7;
	Mon,  5 Feb 2024 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159793;
	bh=NPy4Qjb0aNJaUt1anX4DLKcJO8MAHo9hxB1lf/SnJVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0IFu7iQqTx6bOTOd9vriIMwWn31HI/bPOkRqA2a4tGAG8ZJiPvlqlSUl6BO+dg474
	 19J0CsV8O3ClscHUREWfK1OXMtqF45AC4IRjf4N24PtEwWeyHEMeogv3xevuQPmCkA
	 SSpPInlyWBV2jxqtCMQPZJQnUzoEJY0pM/MPduZM=
Date: Mon, 5 Feb 2024 04:47:01 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: core: make rpmsg_bus const
Message-ID: <2024020555-disrupt-remark-5e34@gregkh>
References: <20240204-bus_cleanup-rpmsg-v1-1-1703508c23b7@marliere.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-bus_cleanup-rpmsg-v1-1-1703508c23b7@marliere.net>

On Sun, Feb 04, 2024 at 05:32:05PM -0300, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the rpmsg_bus variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

