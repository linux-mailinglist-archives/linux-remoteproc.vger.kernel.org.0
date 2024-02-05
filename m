Return-Path: <linux-remoteproc+bounces-457-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0F84A361
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 20:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36AAF2838AD
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 19:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABE763402;
	Mon,  5 Feb 2024 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DMZfyMXu"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207EF633EB;
	Mon,  5 Feb 2024 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159795; cv=none; b=f+8rFXjHV6O0hGp38IP7lcraxFU+1Simx6CQpi2eN5HfheeYsgaMhdWaEoEtuJquPmTHk/fYv+m6FZe6N9K2G2Ghr3CgHew/9nDNKTLc4EdqBUCH2+XXvmLu0hlWrDdTfl6gqIQV/3mcnBBhqDy/VM+XX1esefRepilatETyuGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159795; c=relaxed/simple;
	bh=NPy4Qjb0aNJaUt1anX4DLKcJO8MAHo9hxB1lf/SnJVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAp/r3GH0aiv9eJzU3SP2PE4eIcvUPPkEXF/MiMazuYzIyCbMOUC1KLViRUqsDmQnXi20CbH/HJWukLgZz5+wO28PWPeLr82wUpLb32RfgzfJ3umC6mMlCNCyf0yilkj+mX24bAGoRB0SOiL02mJtM+kXnRpq9Df4qVSw0Wj+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DMZfyMXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C05AC43394;
	Mon,  5 Feb 2024 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159794;
	bh=NPy4Qjb0aNJaUt1anX4DLKcJO8MAHo9hxB1lf/SnJVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMZfyMXuOa1kADPO04CIOl72zvN91fiwL8OGas0toSLB8qyIY3k3y4h5UTytjwCg1
	 s/YGMU+bzPwYyYMzB6XM7m8YSxupQZSalnsnPnKN99Mk99pJLtyOw2hLX/CgzQ6GUV
	 Dtjg8jYqZb3gOPnGKeOUWfEGD16/hxvU7Fu+MgXA=
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

