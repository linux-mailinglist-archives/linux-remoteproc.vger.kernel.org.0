Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECD32348C3
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 Jul 2020 17:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387606AbgGaP5A (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 Jul 2020 11:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbgGaP47 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Jul 2020 11:56:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929F6C061574;
        Fri, 31 Jul 2020 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=VA1JpIwa0xf99JyZG8jJMJXyum5SeKrub+r7dcAIqHY=; b=IFEBUo1QnZiuZ+0x+I8K1vxVBc
        B49t4O/QmjOrKf2n740yGK6WzpiuK9mPZihqyVF9GMTWQmV159Qu9DfDaBlE+fX9XWXMiipNYoNxK
        i9TDb+EiOfhGzqiWpqw1tzr+902wyFErta/uicBfGBPu0LY5gqFmpQbG37XWnh3Z0qffSbkWsLGdE
        CfXp0NU58hBH6eue1IDriSQlYUIU5OrodBBB4IkDBLAZHw2L25Bam8pUI7rkrPQwtg5GEoF/dAiew
        H97ljp690sUCK46v4QFA2931Gwrb/e6KVutgPRbnzoAeyMiIEKeV4rk5zrjEi1lOUFEr2AT+62xCj
        c5YHJH9Q==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k1XOx-0003uh-Qx; Fri, 31 Jul 2020 15:56:56 +0000
Subject: Re: [PATCH 02/13] rpmsg: introduce rpmsg_control driver for channel
 creation
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
 <20200731121043.24199-3-arnaud.pouliquen@st.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3e5b748e-d160-4925-7b6d-535b620f5d11@infradead.org>
Date:   Fri, 31 Jul 2020 08:56:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731121043.24199-3-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/31/20 5:10 AM, Arnaud Pouliquen wrote:
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 900ec8f54081..c5afbf24e793 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -23,6 +23,14 @@ config RPMSG_NS
>  	  channel that probes the associate RPMsg device on remote endpoint
>  	  service announcement.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the name service announcement
> +	  channel that probe the associate RPMsg device on remote endpoint

	               probes the associated

> +	  service announcement.
> +
>  config RPMSG_RAW
>  	tristate "RPMSG raw service driver"
>  	depends on RPMSG


-- 
~Randy

