Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4978E59CF75
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Aug 2022 05:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240108AbiHWD0r (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 22 Aug 2022 23:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239703AbiHWD0n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Aug 2022 23:26:43 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EA65AC59
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:26:42 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id j5so14611935oih.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc;
        bh=Gsyyrjom5d3tsO/Xn15lmH603RwdhQ72lNUI35huiTM=;
        b=mjwiSApllSKwDPCczr3uydgvyvX2wS8lxJEu/gwgp9tVZydQYGWkhlHuAci4uuyoGZ
         CgLVt4nCJxtQOokPMdKkIFNr7AiudAgAyT8VdaZYMtmFkiy86b8516vNxEf5mkehGOW/
         eNRNr4Z5ZBcB1E27dxPG/ixvt4JUx1B8Kj9E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Gsyyrjom5d3tsO/Xn15lmH603RwdhQ72lNUI35huiTM=;
        b=FMhM+eezVwdSCXC7Wxrt8/l07FmF0OzN4HUNNyWsgHeks7Th63M2JBySSlG4ljtPlL
         MN+ZfgTgjOUrUUblkSUbSz/ZMt+6PfPRbnHOqQV2TInfvscYO5XBxD0YsfVCix4D8pFG
         rLFkuah9AbJLM42RGN5eBjCEXNYNR7ZJy1mkf646jOk9zBBfVJxJSKsfJ7izrOpwmwp9
         FC+YvcIKWo/k5pGR2RTH4u7aJardLMzBpfGzPDv411iT7jbVr8l03u6SeAuFa8CM7RLR
         ZYDQSN1YLxqrfp/69F7XsXA43gKMsjxsD038Xhbiab/yPX31pXm0TGEMyiFQsI+nduiL
         os2w==
X-Gm-Message-State: ACgBeo3Ncz+zIi6HzlJMQNT97YOnUbCZAsmqX21Hkt5nKjqCRtoVJnXn
        LXLZhR8L/VPqtWVc2AJ1h14fS5IFVBSrz71mNFYKDg==
X-Google-Smtp-Source: AA6agR60jN8ObvTbkxkB8864F0EhQ2EF92dgEFyCliL7GRPJViDGWxMtWGk0qX37sw5x/kn+Cgzh4TP8P9upti0JHsA=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr546934oiu.44.1661225201548; Mon, 22 Aug
 2022 20:26:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:26:41 -0500
MIME-Version: 1.0
In-Reply-To: <1661156523-22611-8-git-send-email-quic_srivasam@quicinc.com>
References: <1661156523-22611-1-git-send-email-quic_srivasam@quicinc.com> <1661156523-22611-8-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 22:26:41 -0500
Message-ID: <CAE-0n53Lm37zcBAKqTVDHGvHDjDSDDd=Ct-b-XZOBOg=7gU5KQ@mail.gmail.com>
Subject: Re: [RESEND v5 7/7] remoteproc: qcom: Update QDSP6 out-of-reset
 timeout value
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-08-22 01:22:03)
> Update QDSP6 out-of-reset timeout value to 1 second, as sometimes
> ADSP boot failing on SC7280 based platforms with existing value.
> Also add few micro seconds sleep after enabling boot core
> start register.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
