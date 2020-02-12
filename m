Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F027F15AC6F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Feb 2020 16:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgBLPyc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 12 Feb 2020 10:54:32 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:43736 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbgBLPyc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Feb 2020 10:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=EIQuvZVjRgnZucfdtz7UxkDAyXXF62ACmzF0Z1QyBKQ=; b=I5uemIgZznT+KbXN73VDUVcGQe
        YT/UiFrjY2biFKrNf4NvXDs8X7FZJ0am5TD+zu5aZ2+FHjB20O9wkWFzLzXaGdGavuCtBzblcBBKi
        SHjW5dUuZVLM4KV3o7ZhVVA1tGvysjlWcM649K0FS3i54wSZxlIT6LSdi/5WT9ULT+CVnImWlw0M3
        w/dXR7XkrxM9QdfrCzO4ACyK6YjQeOQeHJkVEJAJCH0PbMYP+2X/Gz8GlNmW3ko6xN+Yiqb1shVPv
        e482LAGCQef8sq25rp9W2A5J9Ku20gKII0Tr7zGRrKgVxyHJCKrZHLF4jCfqDT3IIeIq6Yrqcr0OU
        YUUsXz9A==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j1uLO-0002OF-TQ; Wed, 12 Feb 2020 15:54:30 +0000
Subject: Re: [PATCH] remoteproc: fix kernel-doc warnings
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20200212093211.15270-1-arnaud.pouliquen@st.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c912fe7e-601d-6d07-c368-109fecd11a7a@infradead.org>
Date:   Wed, 12 Feb 2020 07:54:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212093211.15270-1-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

kernel-doc supports "..." as a function argument for varargs.
See Documentation/doc-guide/kernel-doc.rst:

"If a function has a variable number of arguments, its description should
be written in kernel-doc notation as::

      * @...: description"


So the below could be done as:

On 2/12/20 1:32 AM, Arnaud Pouliquen wrote:
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..5f9a5812505c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -224,7 +224,7 @@ EXPORT_SYMBOL(rproc_da_to_va);
>  /**
>   * rproc_find_carveout_by_name() - lookup the carveout region by a name
>   * @rproc: handle of a remote processor
> - * @name,..: carveout name to find (standard printf format)
> + * @name: carveout name to find (standard printf format)

 * @name: carveout name to find
 * @...: standard printf format of args to search for carveout name

although I'm not so sure about the descriptions there.

>   *
>   * Platform driver has the capability to register some pre-allacoted carveout
>   * (physically contiguous memory regions) before rproc firmware loading and


thanks for the kernel-doc update.
-- 
~Randy

