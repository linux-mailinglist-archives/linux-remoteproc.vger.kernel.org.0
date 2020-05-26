Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDC71C0726
	for <lists+linux-remoteproc@lfdr.de>; Thu, 30 Apr 2020 21:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgD3T5x (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 Apr 2020 15:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgD3T5w (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Apr 2020 15:57:52 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCFBC035494
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 12:57:52 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n24so2686653plp.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 12:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ara67cN5iki3Ojktfn4ur4orVePchyu4PeOXIZf30Mg=;
        b=d1eBggrtVzvxL+4jQ5qW1PCGyTkhmVC2jWhtfOxi09Fah64Hfo9QDWrK5wcaQL7kaS
         VCY6nJVuOAnNMSPTrr3tfribxfPfH9zUEIKuhaZPyEtT+HEyXhSjOBqIB8+nAlbAZ0OJ
         hPJGn5cvFnZgMLvwzuNfZ0dCiQhXwSwwg4GjxKSDgj7lGVg142DIRyRs3K0cJfmHqfAy
         Vsb5eYy2v9doTOF02Spr+vxNEdYqzVTVGZRcToF7AfC6veZilcm7gp6Rbbc4uaZ3R/fS
         0aMc1b3U5gcI85zHYom6rjYy/tXIKaYrvpXn0LxfHYmu2qd0FNa/WCil414gsv3OnfQZ
         Y04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ara67cN5iki3Ojktfn4ur4orVePchyu4PeOXIZf30Mg=;
        b=CFmSMa5uuFR3Aquq50f46nHXaXwe0adtCWxld62zlFz7mkbTi7ngiK56tQ9nqlk8P0
         KNMxwq4Ju0TN6OF2aKBkB/qBa3vNcAPk7CYpjZlY8YkaZBACPoVb92CAwRgB7HTHvUc0
         I8otggzxNwqOmrYKJy0Un4+OmujITFjnsC8CWPb6dDOPBI1olkQxXAzSrfgQhX6QAZXl
         Y6iz/PyZF/6UjyXwBiJM6Q/cJUHRCoUgvZURkTNkK252A48tNdM9i46mlXdcGmUBYoy3
         uvOjFrYV/rVZhwIb1xXV7DQth0ncS+Kadw77XJ+gT5g/pVhRLKSZSeMoo632f4q4KkCj
         ahdw==
X-Gm-Message-State: AGi0PuYmykyGa3RJ3Y6k3Ug+wjTf7C2GKQ9q1LUNZ5jP9txyqAk9Uwsg
        PgCEeWl47Ld+XFlm0XE8CSjf2g==
X-Google-Smtp-Source: APiQypL6jZ39gXeEW4b2DwBMoz5wCVMdp0O9pLgfSwbPCw/1uJ2G9zdRMWtd4H1ZLuSmHgVxyFGiNQ==
X-Received: by 2002:a17:90a:718c:: with SMTP id i12mr565196pjk.58.1588276672231;
        Thu, 30 Apr 2020 12:57:52 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z1sm503182pjn.43.2020.04.30.12.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:57:51 -0700 (PDT)
Date:   Thu, 30 Apr 2020 13:57:49 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/14] remoteproc: Call core functions based on
 synchronisation flag
Message-ID: <20200430195749.GC17031@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-9-mathieu.poirier@linaro.org>
 <a17d871a-3b3f-a462-9b2c-f9183f80a533@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a17d871a-3b3f-a462-9b2c-f9183f80a533@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 28, 2020 at 07:27:27PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/24/20 10:01 PM, Mathieu Poirier wrote:
> > Call the right core function based on whether we should synchronise
> > with a remote processor or boot it from scratch.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_internal.h | 50 ++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index dda7044c4b3e..3985c084b184 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -72,6 +72,12 @@ static inline bool rproc_needs_syncing(struct rproc *rproc)
> >  static inline
> >  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->sanity_check)
> > +			return rproc->sync_ops->sanity_check(rproc, fw);
> > +		return 0;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->sanity_check)
> >  		return rproc->ops->sanity_check(rproc, fw);
> 
> Regarding this patch I'm trying to determine whether it makes sense to have ops or
> sync_ops set to null. Your[v3 01/14]  patch commit explains that ops can be null in case of
> synchronisation.
> But it seems deprecated with the sync_ops introduction...

Your comment made me go over the logic again...  If rproc_needs_syncing() is
true then we necessarily have a sync_ops.  If rproc_needs_syncing() is false,
there too we automatically have an ops.  As such and as you point out, checking
for rproc->sync_ops and rproc-ops is probably useless.

> 
> And if sync_ops is null, is it still necessary to define a remoteproc device?

Not sure I understand your point here but with the reasonning from above it
is probably moot anyway. 

> 
> Regards
> Arnad
> 
> >  
> > @@ -81,6 +87,12 @@ int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  static inline
> >  u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->get_boot_addr)
> > +			return rproc->sync_ops->get_boot_addr(rproc, fw);
> > +		return 0;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->get_boot_addr)
> >  		return rproc->ops->get_boot_addr(rproc, fw);
> >  
> > @@ -90,6 +102,12 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  static inline
> >  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->load)
> > +			return rproc->sync_ops->load(rproc, fw);
> > +		return 0;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->load)
> >  		return rproc->ops->load(rproc, fw);
> >  
> > @@ -98,6 +116,12 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  
> >  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->parse_fw)
> > +			return rproc->sync_ops->parse_fw(rproc, fw);
> > +		return 0;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->parse_fw)
> >  		return rproc->ops->parse_fw(rproc, fw);
> >  
> > @@ -108,6 +132,13 @@ static inline
> >  int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
> >  		     int avail)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->handle_rsc)
> > +			return rproc->sync_ops->handle_rsc(rproc, rsc_type,
> > +							   rsc, offset, avail);
> > +		return 0;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->handle_rsc)
> >  		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
> >  					      avail);
> > @@ -119,6 +150,13 @@ static inline
> >  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >  						   const struct firmware *fw)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->find_loaded_rsc_table)
> > +			return rproc->sync_ops->find_loaded_rsc_table(rproc,
> > +								      fw);
> > +		return NULL;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->find_loaded_rsc_table)
> >  		return rproc->ops->find_loaded_rsc_table(rproc, fw);
> >  
> > @@ -127,6 +165,12 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >  
> >  static inline int rproc_start_device(struct rproc *rproc)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->start)
> > +			return rproc->sync_ops->start(rproc);
> > +		return 0;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->start)
> >  		return rproc->ops->start(rproc);
> >  
> > @@ -135,6 +179,12 @@ static inline int rproc_start_device(struct rproc *rproc)
> >  
> >  static inline int rproc_stop_device(struct rproc *rproc)
> >  {
> > +	if (rproc_needs_syncing(rproc)) {
> > +		if (rproc->sync_ops && rproc->sync_ops->stop)
> > +			return rproc->sync_ops->stop(rproc);
> > +		return 0;
> > +	}
> > +
> >  	if (rproc->ops && rproc->ops->stop)
> >  		return rproc->ops->stop(rproc);
> >  
> > 
