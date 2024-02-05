Return-Path: <linux-remoteproc+bounces-451-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623584A352
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 20:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88CBF1C21150
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 Feb 2024 19:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96126088D;
	Mon,  5 Feb 2024 19:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T/apN5P0"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1060863;
	Mon,  5 Feb 2024 19:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159792; cv=none; b=lw+OYbbpETy26MH9kFartbhg4r7BNpLqfYp8eradbLsVCtBE3cQZlPpJIkDJxVQXpG/glkiINZ9kkvJD46+ean9vJHO1XwxrI5lSmLl/rEhxQnfPd0L00QiwuiCQD2mhI0hXgirPdW+ELQ7ydPS8K/5Z1XHRXupyvsUgwfsU45o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159792; c=relaxed/simple;
	bh=NPy4Qjb0aNJaUt1anX4DLKcJO8MAHo9hxB1lf/SnJVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mkr1DI6YA3v8ZMdoz+15GRlINLFhekMu10yCV3Tb7Tr/5ka/ZTULl6tVNABMYOvo5GHEUPYwYG+7WAw5njzvGUooaMJJuLncCK4JHjeFC9T95PtGrbbEKMuixKygZ1AOjXFG2fABMPGiOFVp/5pdoJVKS3zAG7cQareTjK3emGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T/apN5P0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4777BC43390;
	Mon,  5 Feb 2024 19:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159792;
	bh=NPy4Qjb0aNJaUt1anX4DLKcJO8MAHo9hxB1lf/SnJVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/apN5P0y/JYiDYtJajEfkurZzsyudo18l2iha29eDm3AhfTCkcbE1N5jsJGve8xN
	 evWBU6clLQXa0AuKw22uJfHgbLC1LqgpdcaRvzj9+dy8hO0atb+DZ6FVJ+PHDNm6/c
	 cHXFoGCOTrsDpNbmPwEEPMQWB5kIWEInuB3C0O7k=
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

