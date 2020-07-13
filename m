Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E680A21DFAF
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Jul 2020 20:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgGMSad (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Jul 2020 14:30:33 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33522 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbgGMSad (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 14:30:33 -0400
Received: by mail-io1-f67.google.com with SMTP id d18so14595729ion.0;
        Mon, 13 Jul 2020 11:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NHhkcNXb84hSAAGGaYzyykFtvdzROqlQA3oYhJq02hM=;
        b=hNZydfhJx6SskkyezyOooTRYNX7nlv0/wYecSzx2OK0t4j1oxOMfD1psO/G9Bu/O5w
         ymGMe7KkZUEz+DmKBwVIpJ8xqatiLgkaoCoiG4K+AOjMgX4cUFJ03BRoLqvGQuTmSk+k
         pOFZAfqa6v2simAWVLohtZjR+HAB7zBx+t5lSKQmU9QRuXWGjC74BNAP3Kg1aIah/wSK
         24CW1su1HPlKvjttiBl1Ya65+StVlzQutn0fGRPN1rZ/Zpf2ebfim5uncjbQm9f0JSrS
         qZVRBYSEphq6ZXgJiBK9kgQWqiB/lAWrTIQ0UKi0vmJ0nxpeHG94u6eTBkloajnjVMDN
         Whzw==
X-Gm-Message-State: AOAM531il0XVja2H4loUCsR79L+CQL5TAFAjUIU1z9zrILxQzpYHiczT
        P9BEr4rKMHaA9T9HkmikosmAIGqf+A==
X-Google-Smtp-Source: ABdhPJwAtRsdg6KD5FHFMosiY8HZz72nLwAuFkbXMPZzCJadowi7jZH/+kSwAWiv7GK7DiIT/0OFSQ==
X-Received: by 2002:a5d:9dc4:: with SMTP id 4mr1118287ioo.172.1594665031757;
        Mon, 13 Jul 2020 11:30:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t74sm9021781ild.6.2020.07.13.11.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:30:31 -0700 (PDT)
Received: (nullmailer pid 502654 invoked by uid 1000);
        Mon, 13 Jul 2020 18:30:29 -0000
Date:   Mon, 13 Jul 2020 12:30:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: remoteproc: Add bindings for C66x
 DSPs on TI K3 SoCs
Message-ID: <20200713183029.GA502585@bogus>
References: <20200612224914.7634-1-s-anna@ti.com>
 <20200612224914.7634-5-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612224914.7634-5-s-anna@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 12 Jun 2020 17:49:12 -0500, Suman Anna wrote:
> Some Texas Instruments K3 family of SoCs have one of more Digital Signal
> Processor (DSP) subsystems that are comprised of either a TMS320C66x
> CorePac and/or a next-generation TMS320C71x CorePac processor subsystem.
> Add the device tree bindings document for the C66x DSP devices on these
> SoCs. The added example illustrates the DT nodes for the first C66x DSP
> device present on the K3 J721E family of SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v3:
>  - Refactored the common ti-sci properties "ti,sci", "ti,sci-dev-id" and
>    "ti,sci-proc-ids" into a separate binding ti,k3-sci-proc.yaml.
>  - Dropped the general description and maxItems against reg and reg-names
>  - Added items list under reg
>  - Removed the other binding references from the description for resets
>    and mboxes
>  - Revised the memory-region description and listed the mandatory items
>  - Updated example to drop reserved-memory nodes, unused node labels
> v2: https://patchwork.kernel.org/patch/11561781/
> 
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
