Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE9225E89
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 May 2019 09:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfEVHKJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 May 2019 03:10:09 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37459 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfEVHKJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 May 2019 03:10:09 -0400
Received: by mail-pl1-f196.google.com with SMTP id p15so615661pll.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2019 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fCRROP9NBltOxzgAq0/D3Ao7lRaQcGARTZuEksVTeIE=;
        b=jDK8f0AIPnLTDKqThYgbnnMIRZnXG6bG8dOMk7HLI+XRklgH0VYCXSLvXpegk1leos
         VRup1yLp9lZMRyVc2Ir69OJABWCHtCup3qmwkRu9i8GDVrCHDg5HS81igHd4r3TPytrh
         Tr5xs5F4RPuZ0TEnsnj3Jc/Ww9rL+TtKiQIn8Hd4PEr5/MK+0BrwJuRqOsmvm4QpRLmP
         CBXPM2jiFBfe8M0RhX/8wQYl8p4COPvJEgRupQ2pa0MZSTUZEQHrL8haFhvakqCCNy3d
         l6FyycvcdnRrciwSQ8WZUSS+V0fmY3QGOxqT4TDsqnvPDPjvZuTc48wSbaM7r2uazmfO
         msZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fCRROP9NBltOxzgAq0/D3Ao7lRaQcGARTZuEksVTeIE=;
        b=Dj/6541OC7YZhbbLf1upmVaxUq/1F9E9k8GL4EdPjvChoql5P0vPEKmEQmfC2zLDED
         /sh1l46lbuK3hDUWgra2bwuj3e6QJK38kfKWugLs976v+PgFgX87xgig0dOt8sPdS4tk
         tBHhOYQthXHsyHEW1GWmhKl3Zt/Ob5Ea3t13JmovxWEsBYjoUlq/xJr3xuACYeSUrafl
         F6h59BqbvIuS0fzz7WXlCZkqsm28j4yd3J/eX/vMDXBel7d5Zj0jeZ/ZhiuqF540Vmy0
         dXWO63irGN6VKfCj7IRUEu9CVM3TgGocKkb3t3cDjbteicyytaQZddUUzSlQeSe5cfS2
         8nTw==
X-Gm-Message-State: APjAAAWwqQDlmgvDDSQ/3xk/5DC3hAagpcq1UYuonDprtLSy934U6lPd
        9rQeKQJGzhFQWG0+IPRZc9/x6kDqYCI=
X-Google-Smtp-Source: APXvYqzyiPjhfO/QEFAFdpJ4Y1w36YN7/I7swSdgYuGNaqNs5h8kGZpZQ3NcxsY+vm07iq8L+DdMqg==
X-Received: by 2002:a17:902:e583:: with SMTP id cl3mr89316624plb.35.1558509008254;
        Wed, 22 May 2019 00:10:08 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z4sm28164958pfa.142.2019.05.22.00.10.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 00:10:07 -0700 (PDT)
Date:   Wed, 22 May 2019 00:10:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com
Subject: Re: [PATCH] remoteproc,rpmsg: add missing MAINTAINERS file entries
Message-ID: <20190522071005.GQ31596@builder>
References: <alpine.LFD.2.21.1905140700500.10964@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1905140700500.10964@localhost.localdomain>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 14 May 04:02 PDT 2019, Robert P. J. Day wrote:

> Add a few missing file and directory entries related to both
> remoteproc and rpmsg.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Applied

Thanks,
Bjorn

> 
> ---
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb9f9d71f7a2..fa0958e23b97 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13294,9 +13294,11 @@ L:	linux-remoteproc@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/remoteproc/
> +F:	Documentation/ABI/testing/sysfs-class-remoteproc
>  F:	Documentation/remoteproc.txt
>  F:	drivers/remoteproc/
>  F:	include/linux/remoteproc.h
> +F:	include/linux/remoteproc/
> 
>  REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
>  M:	Ohad Ben-Cohen <ohad@wizery.com>
> @@ -13306,8 +13308,11 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git
>  S:	Maintained
>  F:	drivers/rpmsg/
>  F:	Documentation/rpmsg.txt
> +F:	Documentation/ABI/testing/sysfs-bus-rpmsg
>  F:	include/linux/rpmsg.h
>  F:	include/linux/rpmsg/
> +F:	include/uapi/linux/rpmsg.h
> +F:	samples/rpmsg/
> 
>  RENESAS CLOCK DRIVERS
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
