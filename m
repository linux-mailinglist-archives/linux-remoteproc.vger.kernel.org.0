Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECF378633D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 24 Aug 2023 00:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbjHWWPm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 23 Aug 2023 18:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238584AbjHWWPi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Aug 2023 18:15:38 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1CFE75
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 15:15:37 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5359841f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692828935; x=1693433735;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oHf1l2z9AjLuyh4htERLodd33yFmQMBIj0IXF8GTqyU=;
        b=L0E4E4DdQg/VjMvFyDYbuLcsYT+qH3TLogwq29RViDCwA16f1QHcMNHwW/6lUmytiD
         8E35CZ3C50iTG7FN2yft102ijKm6B5rFkZNlBCHwHZes0QRV5ffNZJ0/3Mp+2LDvFWr5
         ZQcbOyRNQbaYY3rO7ebET7hn3rUTZK8QCM5zVQiPvDWHjQVejIARR+MMeZ0fsVVBjBUF
         qM1cbDfAEQUfC4mWb7+J2kCop+Jbcp/ED0s2r0SFF4aqUiWlzSiUXg1jb05uKRT9miFH
         0hpc/hvDd0T4LhN43NUHbcf/hE4s5hju3r7T65kybGATsn2v/8UXXI1iuxURtud4SxXV
         q+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692828935; x=1693433735;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHf1l2z9AjLuyh4htERLodd33yFmQMBIj0IXF8GTqyU=;
        b=YUP7KKL7oHbkRLSSWsG5fZqWRSrTLMdjcEByX4iP6DihwwHyOrmah3NtD8HfdlssiV
         OwwjXhpQSc5fhnEAVtUa2J/hB+XLy4B6+mnkmYZJaSuHNPVuII0sTNyan/W5E81wJS3x
         ZeKecSXMQvtpYWj3kY2KpYtzln7to8iIQ3jjA/If/ra+Y8SbXgwlE3EmT2OSJgx7jtFV
         ZQH2wE6O0mM4ZjFNgpE5f8ldD9/o+WMX2maveNY1y+710PKOfTaQVkyQeUIeSzSqBjbi
         aziCQcsyIGgurh/gW4CL0QraIvwCyt/IeZnKNaZ8Mfn6oIbUogord6QcjTXkuKIojsqE
         Ar0w==
X-Gm-Message-State: AOJu0Yzk7QqqE5/xCYwLgW2atT4EQzM9hpYQfHgXwDLI0G/KcjR9Lhr0
        mMAZg7C+x/8jRfdmGsnrhE8CaxRFvofzPjRRo3QabyKBYPJQxwS4WNo=
X-Google-Smtp-Source: AGHT+IHrq1sATLOIdkcG4jzCPg2eEPBHjOGw0u1fnd1lq1CkpF0uxH9KXgJks7P08NnsyQCxUY2O1uBNK1z5cAva5pU=
X-Received: by 2002:a5d:4d85:0:b0:315:998d:6d25 with SMTP id
 b5-20020a5d4d85000000b00315998d6d25mr9812114wru.1.1692828935076; Wed, 23 Aug
 2023 15:15:35 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 23 Aug 2023 16:15:23 -0600
Message-ID: <CANLsYkxQXwjhX10=Hh_aSrwBrL3NACgg=S2PYFc6VQzgGw8DFQ@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for August 23rd 2023
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v16 00/14] Add support for MT8195 SCP 2nd core
[PATCH v5 0/5] TI K3 M4F support on AM64x and AM62x SoCs
[PATCH v2] dt-bindings: remoteproc: pru: Add Interrupt property
[PATCH -next v2] remoteproc: stm32: Clean up redundant dev_err_probe()
