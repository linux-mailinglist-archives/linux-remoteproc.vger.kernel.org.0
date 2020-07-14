Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1977A21F806
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Jul 2020 19:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgGNRSj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Jul 2020 13:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgGNRSj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 13:18:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEABC061755
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 10:18:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f16so1835063pjt.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c15y85BkbUp7X44x/i+dNeMDGlH+0uJzTzuvHalV8aE=;
        b=BuLeN0etB1NEcnEw2q6z+7syg8z71dJjxugF1Y5AURY/hQStDfVpnjS4j320I7zDum
         pP+biyLV5sBha75g6N4HO1uVKoBi66RkQxd8nAgSdgCPns6VtiILvKPWQ+NC+noT2UnA
         Z8eUUv6oknhqajvDUhUQ+RN1Av6o0MWQ6WvWvDSGjpTT3ZPTHL5ncGuKLDrQJ0Ly7Oe+
         tBmjRQvkYR6v4ucsHGNnk0SN99/iLLiIRNlhiYl8Y2uKf6UkInzTmKJUTWdf/oCNZ5j4
         5SMItdBnNUiPWupE5l38FjAY7CefEiThmwpQQ6eRQrO7bLe7WxmaAsKydB8BONcXaw1P
         2Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c15y85BkbUp7X44x/i+dNeMDGlH+0uJzTzuvHalV8aE=;
        b=psXwRKxSlVeG+HDuxXSYDebdtSwhlq3QS9YiFWxqQDwkPaZ+x6fKja47gZ6Y6p+Pwv
         VRxkx5rcptCsDRDTC5kUCaRzHZF/qnrrjhWj1KaWpUo7QbeQ7rrowJMFtd+DD8rZl6Dz
         qr/Txfb35JgWbDCpSRc8N1ClCauFJdw1m/YfejGnpksQ4/8VEgUc8plEy5WWjpnd4u1p
         4+Te8peNoXKOF+1bOI8wCWgtb/m6EbM/MySkIURLc0o76/Wrz6dhznbDZExUhBeDkX37
         9bt7fDWD9IZCLF7UjZp3doOv3f6nd8iMzu1XQ75+Gvqz8t3tY7x48osjiV5LSrTLgqZT
         alFw==
X-Gm-Message-State: AOAM532ulDzGYbExVZYswRolaexIWPvhzLfCSIOVGIt6oSAM6qK7W6cQ
        Vk6kDur8CHNgyu5EfaYAoFazz2hzCSo=
X-Google-Smtp-Source: ABdhPJwb8d6upM79bWxs/jo2t6s64UTCAPVbHf6hqvttrygX5q3Ad+0x1EkLILUbcegPzb2w+169JQ==
X-Received: by 2002:a17:902:ff0c:: with SMTP id f12mr4846572plj.254.1594747118677;
        Tue, 14 Jul 2020 10:18:38 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id cv7sm3052654pjb.9.2020.07.14.10.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 10:18:37 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:18:36 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v1 2/4] remoteproc: qcom_q6v5_mss: Replace mask based
 tracking with size
Message-ID: <20200714171836.GA1407705@xps15>
References: <1594326716-15474-1-git-send-email-rishabhb@codeaurora.org>
 <1594326716-15474-3-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594326716-15474-3-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jul 09, 2020 at 01:31:54PM -0700, Rishabh Bhatnagar wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> In order to land inline coredump support for mss, the dump_segment
> function would need to support granularities less than the segment
> size. This is achieved by replacing mask based tracking with size.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index feb70283b..c6ce032 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -181,8 +181,8 @@ struct q6v5 {
>  	bool running;
>  
>  	bool dump_mba_loaded;
> -	unsigned long dump_segment_mask;
> -	unsigned long dump_complete_mask;
> +	size_t current_dump_size;
> +	size_t total_dump_size;
>  
>  	phys_addr_t mba_phys;
>  	void *mba_region;
> @@ -1203,7 +1203,6 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  {
>  	int ret = 0;
>  	struct q6v5 *qproc = rproc->priv;
> -	unsigned long mask = BIT((unsigned long)segment->priv);
>  	int offset = segment->da - qproc->mpss_reloc;
>  	void *ptr = NULL;
>  
> @@ -1229,10 +1228,10 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  		memset(dest, 0xff, segment->size);
>  	}
>  
> -	qproc->dump_segment_mask |= mask;
> +	qproc->current_dump_size += segment->size;
>  
>  	/* Reclaim mba after copying segments */
> -	if (qproc->dump_segment_mask == qproc->dump_complete_mask) {
> +	if (qproc->current_dump_size == qproc->total_dump_size) {
>  		if (qproc->dump_mba_loaded) {
>  			/* Try to reset ownership back to Q6 */
>  			q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
> @@ -1274,7 +1273,7 @@ static int q6v5_start(struct rproc *rproc)
>  			"Failed to reclaim mba buffer system may become unstable\n");
>  
>  	/* Reset Dump Segment Mask */
> -	qproc->dump_segment_mask = 0;
> +	qproc->current_dump_size = 0;
>  	qproc->running = true;
>  
>  	return 0;
> @@ -1323,7 +1322,7 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
> -	qproc->dump_complete_mask = 0;
> +	qproc->total_dump_size = 0;
>  
>  	for (i = 0; i < ehdr->e_phnum; i++) {
>  		phdr = &phdrs[i];
> @@ -1338,7 +1337,7 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  		if (ret)
>  			break;

There is also no longer a need to carry the 'i' in:

                ret = rproc_coredump_add_custom_segment(rproc, phdr->p_paddr,
                                                        phdr->p_memsz,
                                                        qcom_q6v5_dump_segment,
                                                        (void *)i);
>  
> -		qproc->dump_complete_mask |= BIT(i);
> +		qproc->total_dump_size += phdr->p_memsz;
>  	}
>  
>  	release_firmware(fw);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
