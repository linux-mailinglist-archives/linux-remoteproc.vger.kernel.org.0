Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 837DB19A16E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 23:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731319AbgCaV44 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 17:56:56 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33023 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgCaV44 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 17:56:56 -0400
Received: by mail-io1-f66.google.com with SMTP id o127so23458396iof.0;
        Tue, 31 Mar 2020 14:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4WUJcrPXs22r9JdeLAnm70kiB0BphSPIJzUg0VapEbY=;
        b=SZoOMKFUBzfQbsJHMuXV85guvwAUNY0us6RWlY8M5l7BPCvCTr15eHZHJ+m9QAH+RX
         VL5PJXYOhvysVzWkZ5DBZMDxVLUJjYrMx53eFGSDth4I8cAEeDhqFUuo9DP8xld1xjYL
         wmEUQGfG0JNJ4ftVYneLtjMxwUaMCPgux82k1c57Iat97RZ5Sm9+Z4NmXtsXw2T8E0nw
         DiYjkBSIZMMY9rjTx61nD+j9AZpQLoh+3mZCZb/x7qOEU4w17kNJ9sIsM08JbpR9wmZV
         bdWushGk1Hj5v1X3Gz5JJsRsu8a+LrYAxvSGgVyZj6T5IsiE2Rwlma9ks3QdIZ/ZqfTv
         xAkQ==
X-Gm-Message-State: ANhLgQ39nT7xSfWvBdqGqSFAl8ASDrudkhRypYkRGGFswgeb9Je/bmhx
        tNEPqBXViYqBW0D2ijfhSLD24YAk/w==
X-Google-Smtp-Source: ADFU+vv0OawzkBUN9BFAdbkSWK1TqBslM3XoIY17+04sBZBRJwhn+CB96C91SkkB2ucf9uoqAPGiyA==
X-Received: by 2002:a02:8798:: with SMTP id t24mr17150645jai.119.1585691814748;
        Tue, 31 Mar 2020 14:56:54 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e73sm42029ilg.39.2020.03.31.14.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 14:56:53 -0700 (PDT)
Received: (nullmailer pid 10981 invoked by uid 1000);
        Tue, 31 Mar 2020 21:56:52 -0000
Date:   Tue, 31 Mar 2020 15:56:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Clement Leger <cleger@kalray.eu>,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: k3-dsp: Update bindings for
 C71x DSPs
Message-ID: <20200331215652.GA10923@bogus>
References: <20200325204701.16862-1-s-anna@ti.com>
 <20200325204701.16862-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325204701.16862-2-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 25 Mar 2020 15:46:58 -0500, Suman Anna wrote:
> Some Texas Instruments K3 family of SoCs have one of more newer
> generation TMS320C71x CorePac processor subsystem in addition to
> the existing TMS320C66x CorePac processor subsystems. Update the
> device tree bindings document for the C71x DSP devices.
> 
> The example is also updated to show the single C71 DSP present
> on J721E SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 78 ++++++++++++++++---
>  1 file changed, 69 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
