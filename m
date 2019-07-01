Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319C55ACFC
	for <lists+linux-remoteproc@lfdr.de>; Sat, 29 Jun 2019 21:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfF2TFb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 29 Jun 2019 15:05:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36490 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbfF2TFb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 29 Jun 2019 15:05:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so4574204pfl.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Jun 2019 12:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bTs7ErguXXMoWO56S334gRVdj+FZX2DsPTRLxIpz9t8=;
        b=LLdZE4M2ciYbPY4mOKh8tQHXyqmji0erJvQCPdtNO0fP9nZWb2lrY4/qJkwtJkj042
         zMCSTm5KGLpMUXbxP3emIU4VrLkNnTzRNeZ5zbsDL9u6ZTvr4lt1ytyCSr8FWL2E09EI
         4Mhp//XdkmXj8fZg6oGJrwFkrOefeIV5QLEZV53jSd/InI0z11jDqHRcpiYLEBaMxRix
         FwXOBVcHrySC587/h6TrHFjlGa3m0y+1OEZ8Cm+fgPitY96afTXYWzFTPJPt50GmpJka
         JoyvTts6+nqF+F/zYlzzscC8LZllH6pRLEtJ92cXrp9GkU3Y9UOo3e8aVYDtraiHYoUf
         MYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bTs7ErguXXMoWO56S334gRVdj+FZX2DsPTRLxIpz9t8=;
        b=f2Tky9ei9s7Eae21c9+ARQC4IuuP113HvP9wWMyATlkFtPTd6IyXwheMTR1IlF6koc
         vYilCvU8BLnFqB/tRi5fLe8wX5RfT12aQEfzWEdPZ7rgm3fva/6KILJNSclj5XHnKT0F
         2swQDSkNXpeXHN6Uj4IAzKa7HIXKpHTuVgS0iIOMXrtks7UBJ4b994NCaOZDiyOAmhhO
         MXMDAzbYIPGp6U0x9EQqBqydxYeWc0r5M3RkhO+3sn/DoN4yRynbhZJAPoCTyrNrVHPH
         OuVo7eGAPRP3oGg6HC5SgP8kwKlakJp1pMKEHPFxfwbMjOO3tqkLFvXQ/vi4XsC5ZSCZ
         NRiQ==
X-Gm-Message-State: APjAAAWiodlOuMTABIPDY05NZAKzW9tE5YW4i6/NO5m0QnkY7pgw/yNg
        r6+ua9Ter1xGDOcP98VqMOMQgA==
X-Google-Smtp-Source: APXvYqwFqUQNKvCJEdwC8KlJelEfndpt8UZDkqqrlqpdG3G7Bc2576Sl4aGCvBpkKsTABGZBRezztQ==
X-Received: by 2002:a63:e43:: with SMTP id 3mr1359183pgo.402.1561835130627;
        Sat, 29 Jun 2019 12:05:30 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v22sm1462700pgk.69.2019.06.29.12.05.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jun 2019 12:05:29 -0700 (PDT)
Date:   Sat, 29 Jun 2019 12:05:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2] hwspinlock: ignore disabled device
Message-ID: <20190629190527.GG23094@builder>
References: <1552064026-11415-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552064026-11415-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 08 Mar 08:53 PST 2019, Fabien Dessenne wrote:

> Do not wait for hwspinlock device registration if it is not available
> for use.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Applied with Suman's ack

Thanks,
Bjorn

> ---
> V2: use 'goto out' instead of 'return'
> 
>  drivers/hwspinlock/hwspinlock_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
> index 2bad40d..d806307 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -333,6 +333,11 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
>  	if (ret)
>  		return ret;
>  
> +	if (!of_device_is_available(args.np)) {
> +		ret = -ENOENT;
> +		goto out;
> +	}
> +
>  	/* Find the hwspinlock device: we need its base_id */
>  	ret = -EPROBE_DEFER;
>  	rcu_read_lock();
> -- 
> 2.7.4
> 
