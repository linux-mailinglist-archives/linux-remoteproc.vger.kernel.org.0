Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069E715AD35
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Feb 2020 17:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbgBLQWH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 12 Feb 2020 11:22:07 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52776 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgBLQWH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Feb 2020 11:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=paAaZ5BcMuWyEdjcdidH9zALtMbJC+QbPpvk37Tl80I=; b=NqlArlMmBBjgYzUA5uHWPfVEll
        GCLftbjGmqDziXM7xmgbIVIP21UtsNTqK5mgfRMjPnygBG2huXvhSN6UodVXrSU77/vd+Mv+6Edr/
        wtRxZyoM5wGtXPEdlQAwRFQhnHjkPpZLTSH10LLlXVXwNdvK0Patk6+rDbs8I05DgctJt8rMVoUFD
        gLmq+bdJPUguX3hF0MsJVvC6v9jZ5it9IuKXzVsNSu79Pjh1tNgf/RXfosb8FpwvLYK/gUc2/lt/S
        Td0z1mKBfP7awDhO4912FD3QZcfagFLm0wAw2eyAbRbH0OJnESEXeiTadGfKYID8NmLjMUzpwNXce
        6qA0C02A==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j1um6-0005AQ-3T; Wed, 12 Feb 2020 16:22:06 +0000
Subject: Re: [PATCH v2] remoteproc: fix kernel-doc warnings
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20200212161956.10358-1-arnaud.pouliquen@st.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <90b9f2de-bdde-f464-1985-fbd4d9a8dcf9@infradead.org>
Date:   Wed, 12 Feb 2020 08:22:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212161956.10358-1-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2/12/20 8:19 AM, Arnaud Pouliquen wrote:
> Fix the following warnings when documentation is built:
> drivers/remoteproc/remoteproc_virtio.c:330: warning: Function parameter
> or member 'id' not described in 'rproc_add_virtio_dev'
> drivers/remoteproc/remoteproc_core.c:243: warning: Function parameter
> or member 'name' not described in 'rproc_find_carveout_by_name'
> drivers/remoteproc/remoteproc_core.c:473: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_vdev'
> drivers/remoteproc/remoteproc_core.c:604: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_trace'
> drivers/remoteproc/remoteproc_core.c:678: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_devmem'
> drivers/remoteproc/remoteproc_core.c:873: warning: Function parameter
> or member 'offset' not described in 'rproc_handle_carveout'
> drivers/remoteproc/remoteproc_core.c:1029: warning: cannot understand function
> prototype: 'rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = '
> drivers/remoteproc/remoteproc_core.c:1693: warning: Function parameter
> or member 'work' not described in 'rproc_crash_handler_work'
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c   | 10 ++++++++--
>  drivers/remoteproc/remoteproc_virtio.c |  1 +
>  2 files changed, 9 insertions(+), 2 deletions(-)

Looks good.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy

